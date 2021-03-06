if Rails.env == 'development'
    Swagger::Docs::Config.register_apis('1.0' => {
        controller_base_path: '/api/v1',
        api_file_path: 'public/api/v1/',
        clean_directory: true,
        base_path: Rails.application.config.host,
        #base_path: 'http://#{uri.host}:#{uri.port}',
        #base_path: 'http://localhost:3000',
        camelize_model_properties: false
    })
end