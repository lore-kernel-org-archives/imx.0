Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22933CC
	for <imx@lists.linux.dev>; Tue, 16 Aug 2022 10:09:02 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id bx38so10000790ljb.10
        for <imx@lists.linux.dev>; Tue, 16 Aug 2022 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=N21IrFoF+c3Uz8gbDUqJNJKQFeftZ1grSPLtq6SWU6s=;
        b=dAE+Zn7Q6q2G9v+tf5/mblVh57atpAB6AzzHGn0zME2jXFSpJjfjNlRJRNFkNi1dya
         NUD3vhxtgCqrMz7vHX3+MMXQwTKnCD1kXjLE3+H/KJ4MrHTdrAzJafgGiFyMg1wz/hjb
         JdCVskrChS9leLIFnT1AUn160zF8iJQOej0RAqSf+6ZFttDlOUjySc+SwYZAAM2QDCL9
         2neNwhjkLK+LOZU72iKIFW1mv6huqUlUYVX48jjxuNlrsZm6M22cby9hKsE1l6Jdphv/
         h8DIKyycuQ0WyU0k0RVxsbW5fsfI4KcpZtgkv3gViTjirl2fA32X/o6O+CYA2IvXcAMG
         /b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=N21IrFoF+c3Uz8gbDUqJNJKQFeftZ1grSPLtq6SWU6s=;
        b=45Pw/eEGdzaUI2froxISmu1HHsteg0AibPfa41M+FMl2Q2Qm057e0hPssTrWpwgM9E
         nzNIZOonqg8vTLso22m56eTToCdmQLHsOyI9kq7nsW+Gg6aSjH+pxSbi4SKkFr/iJWyW
         7oN2qprv5du8VWQ6316/NnaBDoDQmcll2uVQkMNdcI6SoC7md12F1+oa9DAOINIg61pi
         mhg3UZtiQo2mtnZUat4K4N4qi+20Mqx8QxjBqMHyQ/WEjBMU9T8jXaftnXINBlTMgx3O
         3XXKvhlXwlmeIflxMUO88UbJp6GdcGSImKdVJGgFWXFLf8BmiyQ2ntRLGQ4y03cKW84Q
         4V/Q==
X-Gm-Message-State: ACgBeo3xJx6NH6aEgnuVyPnyc8EHUwjYLJHc6Zr7f8+MqQ5if1fWfRUz
	CX09zVEsWDjJtvVzGdv6JaDh1A==
X-Google-Smtp-Source: AA6agR40m0D2CidnyS7bnmcP5XVt8y0iMYN1GPXTiBKv98Om8Y9kz6bF2mVjX/agj5jE1V3udzey1Q==
X-Received: by 2002:a2e:b8ca:0:b0:25f:df8b:f867 with SMTP id s10-20020a2eb8ca000000b0025fdf8bf867mr5970635ljp.269.1660644540627;
        Tue, 16 Aug 2022 03:09:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id v8-20020a2ea608000000b0026182c4a5c6sm954903ljp.120.2022.08.16.03.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 03:09:00 -0700 (PDT)
Message-ID: <265b2a5f-fcf7-53a0-5de0-1cb753581515@linaro.org>
Date: Tue, 16 Aug 2022 13:08:58 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 3/3] gpio: imx-scu: add imx-scu GPIO driver
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev
References: <20220812133012.7283-1-shenwei.wang@nxp.com>
 <20220812133012.7283-4-shenwei.wang@nxp.com>
 <CAMRc=MexvX_sZK6RdiAdjNQnvqAU_o_g7pCfUPDORHnQ4PcEMw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMRc=MexvX_sZK6RdiAdjNQnvqAU_o_g7pCfUPDORHnQ4PcEMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 12:06, Bartosz Golaszewski wrote:
> On Fri, Aug 12, 2022 at 3:31 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>>
>> The SCU firmware on i.MX8 platforms provides a set of APIs to
>> control the GPIO PINs on the SCU domain. This patch implements the
>> standard GPIO driver interface to access those PINs on the
>> SCU domain over the SCU APIs.
>>
>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>> ---
> 
> This looks good to me - Krzysztof: do you have any other comments?
> Otherwise, I'll pick it up soon.

No, I acked/reviewed bindings, so entire set is for you. Thanks!

Best regards,
Krzysztof
