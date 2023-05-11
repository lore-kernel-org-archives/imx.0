Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B21B919
	for <imx@lists.linux.dev>; Thu, 11 May 2023 09:24:01 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-959a3e2dd27so1480396466b.3
        for <imx@lists.linux.dev>; Thu, 11 May 2023 02:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683797040; x=1686389040;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JA5xPjeOoojypgcBqSFOVnz99GxgTTj01ItFi8GBvTU=;
        b=unHqB+68GfcbdTRlwsrD1KXnBOl3FzBk7YWKN3UPV9JxOPofTMog/lPUg+w0AC0zcV
         u6HIfsNXkuptihF0Xn9jTfGEaiKZqPZypWJ6Rs8nIbEAXrNL5QJ9cRWvAtit8341mZyq
         sJ/gm6mjb43TELC7kbwE8rgn42U4htFccqnnu+zEy1vre70l0u5lUKP2mX4vWSuoh2Br
         7m847tcEFgHUx0KaeUATnTTQ/g5e0Dp88nL4ZSSN7z/XigiQsGHwZaCjGPV+tAilnNu6
         QC6kWjHE/TEko46XZY3xMjE3ZyvS9hVRHfjUqrBuJg94kSc5JmYcXM219FkQM1457HHG
         0g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797040; x=1686389040;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JA5xPjeOoojypgcBqSFOVnz99GxgTTj01ItFi8GBvTU=;
        b=WPj87ln7gbjZ/VoxOW92LwXEQsAmVSy3uJ9DskrJKSPDg/qnOmuk00wbP9S0dtwWyN
         60tRWgSresqpY6E4dnJHqVUsQjXJ74RfgXVDsn8q01HDr9FON/4UxTPzgI7RWCU588/h
         Rn7OO9Q9mEc8lhONekOzhNclseL76V3HbbE5hr6cId4nrVcXQDhqPDtagD4SZulf/jPY
         Ui+XsXj+Z+2386U0I1vPl1YdndBul47CVde8BQvM6hthJ99R449JmY2KXT30fkxgsIK5
         DQX83mRHiOczbDxPU6dInD5NVl2qs57Fiv56psh+CVScM4ifNj31ABttFiygZbPiIkae
         KjHw==
X-Gm-Message-State: AC+VfDx38yLhhGq92ZPFrnEAeE0hl2Dvo8auFA/uR5l35X15/e3cHeUD
	qyV4rI9n00CXNQFZICwPCaKvGg==
X-Google-Smtp-Source: ACHHUZ6DpuG1Gh4nYwnUB6gFrZ70a2Esdrm6hR5ekuhcVRREIF6jJkfGUci/IR/Zuw7WtQmw5Q76xg==
X-Received: by 2002:a17:907:7fa7:b0:94f:553:6fd6 with SMTP id qk39-20020a1709077fa700b0094f05536fd6mr21304211ejc.24.1683797040026;
        Thu, 11 May 2023 02:24:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id ia21-20020a170907a07500b00966392de4easm3781089ejc.14.2023.05.11.02.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:23:59 -0700 (PDT)
Message-ID: <7cf19b98-6de4-c576-4fe9-a123da298d75@linaro.org>
Date: Thu, 11 May 2023 11:23:58 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] dt-bindings: phy: cdns,salvo: add property
 cdns,usb2-disconnect-threshold-microvolt
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, fushi.peng@nxp.com
References: <20230510140504.2164565-1-Frank.Li@nxp.com>
 <20230510140504.2164565-2-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510140504.2164565-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/05/2023 16:05, Frank Li wrote:
> Add cdns,usb2-disconnect-threshold-microvolt property to address fake USB
> disconnection issue during enumeration or suspend state for difference
> platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

