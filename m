Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111FB28FC
	for <imx@lists.linux.dev>; Wed, 17 May 2023 14:44:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-96aae59bbd6so155119266b.3
        for <imx@lists.linux.dev>; Wed, 17 May 2023 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684334645; x=1686926645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEhFrj7vz9yOABp0SkbN/pYddQZ33xU58y7pce4fLdo=;
        b=JGjVjH6bHbptB8N6uV4nqUsn5hpfMdmSe5rRrLtgooxNm4omIWiqx90ybtylHqF/iS
         grdgtXyu4J0pJo/MYLvodjvhiqL/pnQ7pgbt+kIQNk/R1+kLsydmRnoyjuWhhtqSdWlJ
         7oU+UpIYLGig3odk8AJaLtnnllljLBC9bFBB3duanaG5TK2rUgzKgA54IzVDQEV7OdQp
         J1aXUISvCfSzF9mU3kHklZJ7klkGLmhUM68QuyM4QbOghum8N/mWkqiTm7HNRxCS5Nov
         EMoLnMqKRfa168gb1lilSET7laE+fgD0Wldj9EGcjV7n2cxdlAKkiEZp3IkdbkBKBIGB
         CIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684334645; x=1686926645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEhFrj7vz9yOABp0SkbN/pYddQZ33xU58y7pce4fLdo=;
        b=E1QzR64wa6pdzgOH/DGq4e49TOqDSlaRgxqiyp1V88+Xle8Czpo1B32Sg8kb0t9ETv
         mMDGcW6AKQs8cogw3FESPx+AFFvxx0vzUy8kJihqjFwTXjxBuabgxiYH9zeyWY0doT8y
         hh+PK6J7BQe7/cpLr9lQr1LGU8WZ66j9NjfFi+VMcQqzlNJWumEYKwRdNn0Stc0s/Wce
         CSftAN5hUlSLYlXWtbPs7nrNFU1kD8TtLKulJCC0txUgzfmtCETvsRsrnSuMCgZeKP3M
         7IOsB0uG4BXXJEhIsfZgOa24yuor569wFYaYZLCPrmYzHPUuY9H15ckXXBDtIBEzRjDg
         ZAow==
X-Gm-Message-State: AC+VfDzJctFeqt2JenCDbOYdfLyJQKY1kkGj9KmBLGN7SicAluINnto6
	4u58G936ij1MXpe+OW6yYMlkdg==
X-Google-Smtp-Source: ACHHUZ4dkXnRgNc7bMtacQ5VCgtenN+fiWib2euaz/HKvRvhbvLTDL/znb5ge+1VTYnDjNSAwfsc/g==
X-Received: by 2002:a17:907:72d6:b0:8b1:7de3:cfaa with SMTP id du22-20020a17090772d600b008b17de3cfaamr41028262ejc.3.1684334645199;
        Wed, 17 May 2023 07:44:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id d1-20020a170907272100b0094bb4c75695sm12462099ejl.194.2023.05.17.07.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:44:04 -0700 (PDT)
Message-ID: <cbb32d29-cbbd-7c01-7359-535f6afd701b@linaro.org>
Date: Wed, 17 May 2023 16:44:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXT] Re: [PATCH v5 0/3] dts: imx8qxp add cdns usb3 port
Content-Language: en-US
To: Frank Li <frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
References: <20230327145523.3121810-1-Frank.Li@nxp.com>
 <20230406014422.GK11367@dragon>
 <AM6PR04MB4838A0B0FABE405800E00741887E9@AM6PR04MB4838.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM6PR04MB4838A0B0FABE405800E00741887E9@AM6PR04MB4838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2023 16:25, Frank Li wrote:
>>>
>>> Frank Li (3):
>>>   dt-bindings: usb: cdns-imx8qm: add imx8qm cdns3 glue layer
>>>   arm64: dts: imx8qxp: add cadence usb3 support
>>>   arm64: dts: freescale: imx8qxp-mek: enable cadence usb3
>>
>> Applied two DTS patches, thanks!
> 
> Krzysztof Kozlowski:
> 
> di-bindings missed, Can you pick up this one?

Please send DT bindings to USB maintainer.

Best regards,
Krzysztof

