Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3C2C9C
	for <imx@lists.linux.dev>; Sat, 26 Aug 2023 17:31:39 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bb8a12e819so29297021fa.1
        for <imx@lists.linux.dev>; Sat, 26 Aug 2023 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693071098; x=1693675898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2rKCSZsu8/cjHlt5rvny4PL6NtTe+upkivFRUnpx0M=;
        b=Sfrkbp2WO5UZ4s7fvSATxmQVfafN3gdvAubgBwTMywsS7OSelTX/DaXC6INNMsasHF
         uMPZYL5l9RcDkb5Ymuqj+/EGRpT0RUTdzKX8tYEsxdgetDBey8E1ntZSElFAFWUx5RsF
         QUd5FbluY8iOXyrqvyOQQ+6Akwi3qJFlNLzd8xRYJSe0eo/KMZf06uy6k2xEUUm0E3GP
         IWUh/sCuCnYb4ozQ3fbUW26dINL4QX9XilChawQZR+1BXK7athc43Rp7lXm3kjOiueBd
         UbpgNFZPu8Nl4us7OSoYTvatrW2dHyuXacZ6VXg7IJ5ANT9y7QGqvCUWuKoJpQZFmg0C
         +bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693071098; x=1693675898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2rKCSZsu8/cjHlt5rvny4PL6NtTe+upkivFRUnpx0M=;
        b=VwpUPrYV2wYog2kD2RFADuGCSt4EShcp9FaSN8rQfDOblxWQzG1+BjvWu0hXn/Taiu
         rfa6pM/8XroufTYojXlC/Adh+J+WK3TTRr6UvpeVlQHtD6UdNg2nkRrwYp+0vjo+AX9h
         fxngyF5TZDwtIjzUKArmYbiDwdoWTTJNA/Xm6UB062erTtee8RZp519XxAeQm2Szf2a0
         Od7qouHMnZUZp0Vkx6exEG9atc48ulYUvdqGvpsHuVwn0eimRfN6aDIv8nHzrI845bOH
         135DvYG8VuBA0cdv4od2CAQAYJXBfgXO/0mea83OHKHbZDqm04ULO1j1IxWADRP15l+g
         14rw==
X-Gm-Message-State: AOJu0YyChJDaTdn1sZ79vmS+iXmLCWnDECPoXL7pN/mziBUPQUCzvanh
	ihjuJBGA+Wme9K5GFFODBVmqJQ==
X-Google-Smtp-Source: AGHT+IG9DjB0A++FAUKlFtKnVs7soasltg8AxGuvsxRAUqvxAEnosyk2s9yePUFBDzY+a78jDRIuhg==
X-Received: by 2002:a2e:9d08:0:b0:2b9:b4eb:c39c with SMTP id t8-20020a2e9d08000000b002b9b4ebc39cmr14967716lji.8.1693071097760;
        Sat, 26 Aug 2023 10:31:37 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id n18-20020a170906841200b0099ce23c57e6sm2401208ejx.224.2023.08.26.10.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 10:31:37 -0700 (PDT)
Message-ID: <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org>
Date: Sat, 26 Aug 2023 19:31:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
To: Shenwei Wang <shenwei.wang@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAPDyKFqsn6kVjPFUdVyRxNDiOaHO9hq=9c+6eAK4N-v-LVWUPw@mail.gmail.com>
 <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
 <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/08/2023 17:44, Shenwei Wang wrote:
>>
>> The genpd provider then needs to be a consumer of the resources it needs. In
>> this case a couple of regulators it seems like.
>>
> 
> If I understood your reply correctly,  it seems that the current implementation of 
> regulator-pd is what you have described. Please correct me if I'm mistaken.
> 
> The following are the diff of scu-pd and this regulator-pd.
> 
>     power-controller {						    power-controller {
>         compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";      |	        compatible = "regulator-power-domain";
>         #power-domain-cells = <1>;				        #power-domain-cells = <1>;
> 							      >
> 							      >	        regulator-number = <2>;
> 							      >	        regulator-0-supply = <&reg1>;
> 							      >	        regulator-1-supply = <&reg2>;
>     };								    };
> 
> Are you suggesting to move the regulator-pd to the imx directory and add a company prefix
> to the compatible string?

There is no such part of iMX processor as such regulator-power-domain,
so I don't recommend that approach. DTS nodes represent hardware, not
your SW layers.

Best regards,
Krzysztof

