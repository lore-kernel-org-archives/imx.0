Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9320E4
	for <imx@lists.linux.dev>; Sun, 26 Mar 2023 12:13:25 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ew6so24998289edb.7
        for <imx@lists.linux.dev>; Sun, 26 Mar 2023 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679832804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfylKtuqAdjWyuMFH3aXceJDXKfQlN7GtkmpCp4vpDQ=;
        b=TI/sZ5klonceETXd4v1IIZbs0JqAKBoPoMF22tmnim2jZPaW0GrLb1snHgedeeYKbL
         WCGwlAHywiRjXoslzc7NdAbuBgltPuBvqSLnWrj45JjnGWpNaotrlRZFFHapAQp+6iXb
         OsjmucWoMjH48o0DdltpXS60j80yKVwOZG2FR1CwxvVr3pMjxRdS7J4ayDOE9yXSPnQK
         1L+lFSV0wKztvtZkwST+uwkMsX5z2lLuQ2nUGuJsgUf0pBKSp0OR9OEkYTgBuYxTK2VC
         kqbPYHOr4RVTGVgakagCYQFLdGAr6LGCK6gq9MQjrz8MTkpclDXqOiVdYGidDjMriSAa
         s2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679832804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfylKtuqAdjWyuMFH3aXceJDXKfQlN7GtkmpCp4vpDQ=;
        b=TRbZPy2EgAlZ/vYRy5+FOej1XuVt78mGzXrR3UrApkNnSmFNh+NRHkxPbsh+uf4hAY
         zBHh1ziBiC/C47OlIHjTQL8qVD1wxC5u6OPyNBT7yunNA+biIGOs0MGF5aClz3q+JMMc
         SUlhQdKrp+NnYAn/XO1Y/IAXzrwrIqDiKXeuIqN3QIBQ9WxuRqfnSJuHIuWBO1xfVAqz
         HCncKA13E8neMVqOeWHMdeaf2IgDtXCAwhSVITyZWb0X1ObjHbi1bxeXmAHGVVQ+FbAK
         OilISZhXM2UhvUzn6Zp22oOnK7DHI3w1ntjw4xqdyjzt/myIMyLlKs/pPc4jzXLX9WBP
         3z4g==
X-Gm-Message-State: AAQBX9cePKx0+qJESvUZ0jkV6CSFWproapVrmzTgxjYS2UHjo97pXTAp
	hkqXwDlgRqZdhUKwzdWqgLiCNw==
X-Google-Smtp-Source: AKy350Yvy1Y+JDumuEvGtVH5rvXS3ImzTb1katIGgHGIfY5OqMoBiaG2UM7CLyFikjBrprHV+9iWIg==
X-Received: by 2002:a17:906:3f8e:b0:939:ad91:adf5 with SMTP id b14-20020a1709063f8e00b00939ad91adf5mr9741002ejj.25.1679832803951;
        Sun, 26 Mar 2023 05:13:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6cac:926d:a4f2:aa09? ([2a02:810d:15c0:828:6cac:926d:a4f2:aa09])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090666c900b0092b606cb803sm13112964ejp.140.2023.03.26.05.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 05:13:23 -0700 (PDT)
Message-ID: <3eb2133f-7e9b-ea98-87c8-cd24814bf12e@linaro.org>
Date: Sun, 26 Mar 2023 14:13:22 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: cdns-imx8qm: add imx8qm cdns3
 glue layer
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org
References: <20230323163116.2921999-1-Frank.Li@nxp.com>
 <20230323163116.2921999-2-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323163116.2921999-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/03/2023 17:31, Frank Li wrote:
> NXP imx8qm integrates 1 cdns3 IP. This is glue layer device bindings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3 to v4
> - Drop all clock-assign
> 
> Change from v2 to v3

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

