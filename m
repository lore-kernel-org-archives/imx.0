Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC6CE56E
	for <imx@lists.linux.dev>; Mon, 15 May 2023 16:06:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so113167279a12.0
        for <imx@lists.linux.dev>; Mon, 15 May 2023 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684166765; x=1686758765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Xl3tAHibeX0ELv4ZWI2CzRgdcAwmc/SPOqklbvU4ZE=;
        b=p4qdt4DmHBDJVpl7TwM9UqEhN8F+WOuunchLFSvy0uPZkHhjgEcfWaZNnzeazpNcjA
         bxqSKZDwKK5uQGI386j1VDhbeeUPlQNp+Z3BsdkZv/UwaHB2TXGgc+sUAw3EESGlFg5h
         7WLtmCsGkoTFIJKMPejpqLjuPB/wozpx1W50LWnsUzK1uqJdESJMmtwsreIbGXKVuNXl
         0ete5BfWjj8OjZu1wn2Dvex1PKr7LqoRilqsQBUdQpcFqgytL+6UWdcDHbUVdLBm6u2D
         p1ctnvc1myHoqw3ndjSPDzowm1xmdGJKnGvWPxIsSe+duXVP+t/jI0WGSGHwbvpEfkO6
         Y0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166765; x=1686758765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Xl3tAHibeX0ELv4ZWI2CzRgdcAwmc/SPOqklbvU4ZE=;
        b=WdRt0s6RKmWbYs1qIa5EtNgucUrBHi31Z4dLgJDXrd0+aiUYPXeT8R33ZDFQHnwGHn
         Dwv8Jo3Ld2/eDvHnNap5drQHL39kEBrhO1f5rhpsnmur2KxjznP7lvfzdzv8vnynni3u
         E278WNl1rcWE80wv4Y7nMJxw2CRzS3eowrjv/DlMXj4WNXb3Xpjm1itbtQdnt++NtYGl
         pXjxScoV+M4sjKPe+zFhoFfw2imXk+JDoB8MT6NoMh/kj0SHeEtZW/Tqlkeu7RwDdU3F
         paMTbl1pV8HqnTo8xxb5YlT7P9+en/upXwFISOywgMXM/sNoBj/EesMKmVBMhWBVMJ+d
         j75A==
X-Gm-Message-State: AC+VfDyi1iybUc7boWEI3tG8td1m+UQxeJXmpPFPs5wRbmMIgXHOjr9T
	8Q6Mc2X85QzTuQme5/Bcha11/w==
X-Google-Smtp-Source: ACHHUZ5p8FKApy29QMLH43WyYHiijGbaF1MMvRkWy5MurkL/GUG+BW+9C92IdUT3huvJzEWMLQkVpg==
X-Received: by 2002:a17:907:7289:b0:96b:1606:f015 with SMTP id dt9-20020a170907728900b0096b1606f015mr4494583ejc.18.1684166764843;
        Mon, 15 May 2023 09:06:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id d4-20020aa7c1c4000000b00504a356b149sm7221788edp.25.2023.05.15.09.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:06:04 -0700 (PDT)
Message-ID: <b1e3a89e-1d5e-9fd5-814e-1a3bce0dff0a@linaro.org>
Date: Mon, 15 May 2023 18:05:57 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-binding: cdns,usb3: Fix cdns,on-chip-buff-size
 type
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, shawnguo@kernel.org,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:CADENCE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20230515153710.2799008-1-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515153710.2799008-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/05/2023 17:37, Frank Li wrote:
> In cdns3-gadget.c, 'cdns,on-chip-buff-size' was read using
> device_property_read_u16(). It resulted in 0 if a 32bit value was used
> in dts. This commit fixes the dt binding doc to declare it as u16.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - new patch

This needs fixes tag and Cc stable.

Best regards,
Krzysztof

