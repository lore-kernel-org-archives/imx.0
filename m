Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C5625
	for <imx@lists.linux.dev>; Tue, 30 Aug 2022 09:45:03 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id q16so10734052ljp.8
        for <imx@lists.linux.dev>; Tue, 30 Aug 2022 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=N4LheGfogZwAoz4Rv/ngvYZ5qgXotWdDTgd++DbmjE4=;
        b=yMR844Oy9Ze/yRFGOhG2S6WZEqMvDZZHFlHeR7wdxfjeHJF+5QfyF0dGuHL6yp4fOv
         rdvMTpaNfQOfuWbxl/n8XZtzDwbHrmQL4gAMgF5UsOQAskIfHOw20OGjIwCE9Fa+DlHK
         DeKJg7zSZ220l4BZbyyAbdYz/9b/pIjRCMPTRWI0NHt9eTAOlnRwcf52BjFzEi6noU2L
         9cF1NkvS72kEfqAO9URotrJ4ea9X7yvpIEzevtnnb0t0h+vMwo6wSKE8uw8s5BLFUCEn
         p91Bb0oubgM6vyWgbqwV1uY9oeSlN2se9vAVKn5rjiFcdjWyRWsxxsNLQKnutsIFuPBI
         qewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=N4LheGfogZwAoz4Rv/ngvYZ5qgXotWdDTgd++DbmjE4=;
        b=ooR4miAfhIHXOXaWojon8DlOfl9eb4q+zNYfz4dK/w0TXzcYzjQXJMl6hE1Yrlzjzx
         0P4mR/igMul2Lzjt3lzaInWWPK6KaiIYWKLU5nE7ldzHvyNy/9AF7hYMdUCun51pt12T
         +yqPSCN09saK6t7CpwASjNWDIh9BEqwN6ph6qzSKpHPT55zIT7EtyxJzlX2rbrGuh+nn
         5pVA2qtXQeXAypvdyuqVqW/iXMhQIVfn5M34tz/Y+iaKo5s0tqmXg/qPwrMmmQKHdhEi
         rsTLrx/igJqPezeJQz1pes/Rdy/yD8zMiOUmPXjy7OsBjkTwn6w/hkdyqV5oB+VYj1kH
         UQLw==
X-Gm-Message-State: ACgBeo2PY7+yV9iikTUaaxeaTEToO40AQKfXv5cLGmdTZ4EFx7S7wn0p
	tsL6OPX6nzAPdUzsIBD4T7yj+Q==
X-Google-Smtp-Source: AA6agR4jn6kVx3JsJKuIGOtqSpsDxFV6XeVfQe6nNwKELDQnsJHDnsIDeT+6VZnDMYThKJJoXi2+FA==
X-Received: by 2002:a05:651c:88e:b0:261:b5e5:8622 with SMTP id d14-20020a05651c088e00b00261b5e58622mr6375100ljq.99.1661852701925;
        Tue, 30 Aug 2022 02:45:01 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512360a00b004946e72711bsm552290lfs.76.2022.08.30.02.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:45:00 -0700 (PDT)
Message-ID: <9bbce65a-b955-cc76-ebba-266675c95964@linaro.org>
Date: Tue, 30 Aug 2022 12:44:59 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 1/2] doc: dt-binding: mxs-usb-phy: fix
 fsl,tx-cal-45-dn-ohms max and min value
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, balbi@kernel.org, gregkh@linuxfoundation.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev
References: <20220829153124.2791210-1-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829153124.2791210-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2022 18:31, Frank Li wrote:
> According to spec:
> 	0000 +19.95%
> 	....
> 	1111 -21.68%
> 
> 45 * (1 + 19.95%) = 53.9775
> 45 * (1 - 21.68%) = 35.244
> 
> Chanege fsl,tx-cal-45-dn-ohms and fsl,tx-cal-45-dp-ohms range to [35-54]
> from [30-55]
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
