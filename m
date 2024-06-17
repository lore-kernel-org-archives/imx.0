Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C515ECED
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635311; cv=none; b=BsddTpZPb9WeBPNV7/YCO41ldLOMehYXyTKUAPB9WQux3wVNega0G51jMyg/WfSsfhF416OwWoe0Y2jarvLwMeAxjyzB5KIPF0wpd7rGQXU9K/UnNQsrcHak008mp9VNqRy91FsqT0oaect7MWZrTlhYIzE3dJeKrbIvHIkMfa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635311; c=relaxed/simple;
	bh=D0uG/F1rquD9j/tgu8XpSkKW0CgsYMnGbyRirrsrnsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5TQOBCGhee9cHG8TELBvXHsPZQtBxdaoAOipZteY8aylAS3WjERWo63w65uMgcVwUAAaqMjP5Fs3AGRCDSqUYI7zIInV5Uoh6tNDPQSJWKXpHdyPWdBr+ytqciBQTUU3wi4CZ8ERR74Q8UebanE5dj2K6L+4KbEHOpVo3krGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=raZZAalU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raZZAalU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f70509b811so30998625ad.1
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718635309; x=1719240109; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Tb9ql9Key2zaR+IQJeo7On9ydITOd8hoL6sLepVlgY=;
        b=raZZAalUQsOumcXtcS+5ibJ+UluKWWLBQ11YTC4wnPCPOeRKHLs3SClMyRrMb8mhD0
         uEqhjEc/jd2XjXqf4/q0Zdy0wqSy4Qjenntx7W2Yn8TTyp198k2ITQaXx+Tpi8wnDSLr
         Ez6p/4GGiPG+ZBrV7Rz3iOe9JhwcWnnYj2vlMqHmsNDTjSxv2ww/6S+Ox9Q/oIpcMUN6
         EITepFF5lYvipqUqTbOyu4VNPf7sM1ufjhYepg5bMHEJDDI7tOIBeTW/DCOPEJF0fQ3g
         qmOL+Z79bqSFSHy36n00LOSWW73vnMYHF3SmN4v4eL8bBr8DPRbYLBO7SA1NHjFdIt+A
         6onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635309; x=1719240109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tb9ql9Key2zaR+IQJeo7On9ydITOd8hoL6sLepVlgY=;
        b=ln/8E/4INsv1fbS3ApliG2wPWzOarn8aRyzdVp/dehutpKILe4sQOfNNyWGCZa8uK1
         oRqc/Xvhn6xZQdVvp603SRf4bEsIt3gWNdmxvSIqSycwnpg0RcG6MBKJnFwOMYti6dtP
         bZzLHCr0uhvadfgLF9xcpH7r443HmgwESpYnpz0/9Q4AERo/AEGQo52euuGRn5ZmSDZL
         NFDmxAEMnzjEnhmFhbAG/NsmgjcizhkXb39U8C7tnxAppKDhdscwvjpPwFCPnWcZJA/k
         K+WCulF/Zommvx/FfhdYoCcgiqUchNBZltIM77dn7/hSiLuaEcXTM3ICeGkldhyOyvqc
         by2A==
X-Forwarded-Encrypted: i=1; AJvYcCU4N/s8V59riQMfMfzg7sE8PvQAnsIj+KWYIZiTw9ZTM+0fVxNHTIqYQwjNuNL9y3q38hf/ag4+jwZ0fmhPCr3RM7qr
X-Gm-Message-State: AOJu0YwQbk028Xu+QI9wN3CAtLhWlX2Kv3fINgnB1qenMAfVoDAK70jY
	xWP+uycEFMVUGKtkc4xyxaz7vJn3SXy61CwAmiVt67svVQrre1TbUvyaNMg5G/U=
X-Google-Smtp-Source: AGHT+IEmf39oVNc/A1nD73Ny6p2Cl2YYugmm0/bVmzsrkdWLmqjObFWN5+zXKksSeTd5xGX4xozfzg==
X-Received: by 2002:a17:902:6508:b0:1f7:21e2:6d9b with SMTP id d9443c01a7336-1f8625d4880mr92934795ad.24.1718635309309;
        Mon, 17 Jun 2024 07:41:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e681:7328:24ae:62a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f53e80sm79448555ad.297.2024.06.17.07.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:41:48 -0700 (PDT)
Date: Mon, 17 Jun 2024 08:41:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzk@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, peng.fan@nxp.com, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: remoteproc: imx_rproc: add minItems
 for power-domain
Message-ID: <ZnBLKV+RxX+CclRA@p14s>
References: <20240610151721.274424-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610151721.274424-1-Frank.Li@nxp.com>

On Mon, Jun 10, 2024 at 11:17:21AM -0400, Frank Li wrote:
> "fsl,imx8qxp-cm4" and "fsl,imx8qm-cm4" need minimum 2 power domains. Other
> platform doesn't require 'power-domain'.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - only imx8qxp and imx8qm need power-domain, other platform don't need it.
>     - update commit message.
>     
>     Change from v1 to v2
>     - set minitem to 2 at top
>     - Add imx8qm compatible string also
>     - use not logic to handle difference compatible string restriction
>     - update commit message.
>     
>     pass dt_binding_check.
>     
>     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       CHKDT   Documentation/devicetree/bindings
>       LINT    Documentation/devicetree/bindings
>       DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
>       DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>

Applied.

Thanks,
Mathieu

> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index df36e29d974ca..57d75acb0b5e5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -59,6 +59,7 @@ properties:
>      maxItems: 32
>  
>    power-domains:
> +    minItems: 2
>      maxItems: 8
>  
>    fsl,auto-boot:
> @@ -99,6 +100,20 @@ allOf:
>        properties:
>          fsl,iomuxc-gpr: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qxp-cm4
> +              - fsl,imx8qm-cm4
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
