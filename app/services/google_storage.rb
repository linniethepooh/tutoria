class GoogleStorage
  def self.signed_url(method:, name:, expires:, content_type: '')
    full_path = "/#{ENV.fetch('GOOGLE_CLOUD_STORAGE_BUCKET')}/#{name}"

    signature = [method.to_s.upcase, '', content_type, expires.to_i, full_path].join("\n")

    digest = OpenSSL::Digest::SHA256.new
    signer = OpenSSL::PKey::RSA.new(storage_configuration['private_key'])
    signature = Base64.strict_encode64(signer.sign(digest, signature))
    signature = CGI.escape(signature)

    "https://storage.googleapis.com#{full_path}?GoogleAccessId=#{storage_configuration['client_email']}&Expires=#{expires.to_i}&Signature=#{signature}"
  end

  def self.storage_configuration
    @keyfile ||= JSON.parse(ENV.fetch('GOOGLE_CLOUD_KEYFILE_JSON'))
  end
end
