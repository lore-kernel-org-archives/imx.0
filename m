Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB43229
	for <imx@lists.linux.dev>; Sun,  2 Jul 2023 20:22:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-992f15c36fcso295589366b.3
        for <imx@lists.linux.dev>; Sun, 02 Jul 2023 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688329343; x=1690921343;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ublbiuBAMBGcitttmWmHRPOByzhyZHfUTbys5aw0WvY=;
        b=qsgmn2pqNEedzCSjS+Jmgoi9pvvPIZJxg2U1pAtz2wzuM7qcDsIjcK64EmV1lDP3HD
         5mWSMyRkkUQunknygCz7yhW9Yb8hemX8DSxskGvZn6Yl9rW1tduAoRTw7M8yXEhTrMFM
         sM+oh24Slzz6NMSHQPru7BWOsDf6TrqKrLL4ukph5lYX6zv0lOjUUDmtY1qQHsYYFE0I
         3g+LcgREPUQWsUapSRGENSL/AQu1BY7wNsU6/icin5rWSjVQP2RvI9GhTEApvIIvFsTE
         3i8HVQ2AO6bynb41CoJkdwtHAk3jAmh90/q6Wk9q+Uz4zXdnw7TKuFgChNxZeHtHxwyw
         q9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688329343; x=1690921343;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ublbiuBAMBGcitttmWmHRPOByzhyZHfUTbys5aw0WvY=;
        b=h4voK7lqqPsDwLVNvyRC/1PeuB1JCoyNcPGonq1/7a0OowsFKOP2kO0BxpLhSAsHnN
         Wauy8cYyiLE1yr5mvc8pC+BfNUXFlv7BHMJl4SNbPr1bhGLL7V58e4tqhFRDJTJ3ATMO
         t0DiuppS3e4ju0AGgxzJIJ8vbftpUtwiFhc/3gqlNJrwT20xGjtnDFtbiv0f4TVY7xom
         LO6AMbQSXz3v67EgEOkpT7UdX9+cl2MrltbSBQmVQNSjnhCEnTGgt02d1krSyYUmDZfX
         D2N9F43j1B9HSCu5mGutZMWkoAyl5f4YNcKpne6owIL742NYPlemgLuN4JxTwqWey8y/
         DXGg==
X-Gm-Message-State: ABy/qLYG8AkyCuUqHurrjYR1y0tdLqnTr+swADSR5+jgRBePde750tg9
	vwQIeRa+aK5HTuYnlNObKMdlxA==
X-Google-Smtp-Source: APBJJlEvrPHskJ3Jbrfomgx8u+HL9CUqoe+biMhjntfv6CEkcXdK6cshr112iytfpVJSZr1m4yrYYg==
X-Received: by 2002:a17:906:5904:b0:98e:973:d39f with SMTP id h4-20020a170906590400b0098e0973d39fmr6500392ejq.33.1688329343664;
        Sun, 02 Jul 2023 13:22:23 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id b27-20020a170906195b00b00991e2b5a27dsm8335763eje.37.2023.07.02.13.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 13:22:23 -0700 (PDT)
Message-ID: <3ce07ab8-9ed0-d5c0-e7da-bb24085cc3f8@linaro.org>
Date: Sun, 2 Jul 2023 22:22:22 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 00/13] dmaengine: edma: add freescale edma v3 support
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 joy.zou@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev
References: <20230620201221.2580428-1-Frank.Li@nxp.com>
 <ZJxHc62V72eVMYu4@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZJxHc62V72eVMYu4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/2023 16:45, Frank Li wrote:
> On Tue, Jun 20, 2023 at 04:12:08PM -0400, Frank Li wrote:
>> This patch series introduces support for the eDMA version 3 from
>> Freescale. The eDMA v3 brings alterations in the register layout,
>> particularly, the separation of channel control registers into
>> different channels. The Transfer Control Descriptor (TCD) layout,
>> however, remains identical with only the offset being changed.
>>
>> The first 11 patches aim at tidying up the existing Freescale
>> eDMA code and laying the groundwork for the integration of eDMA v3
>> support.
>>
>> Patch 1-11:
>> These patches primarily focus on cleaning up and refactoring the existing
>> fsl_edma driver code. This is to accommodate the upcoming changes and new
>> features introduced with the eDMA v3.
>>
>> Patch 12:
>> This patch introduces support for eDMA v3. In addition, this patch has
>> been designed with an eye towards future upgradability, specifically for
>> transitioning to eDMA v5. The latter involves a significant upgrade
>> where the TCD address would need to support 64 bits.
>>
>> Patch 13:
>> This patch focuses on the device tree bindings and their modifications
>> to properly handle and integrate the changes brought about by eDMA v3
> 
> @vkoul:
>   Do you have chance to check these patches? Any chance to come into 6.5
>   All audio parts of i.MX8x and i.MX9 was dependent on these patches.

Why do you ping during the merge window?

v6.5? And what about having it in next for two weeks? One thing is to
ping for something forgotten, different thing is to try squeeze patches
skipping our process.

Best regards,
Krzysztof

