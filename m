Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A54268FD7
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108612; cv=none; b=D5PFQ4Zo3T7qVGnJy1TxnADq8hbFUuv39irCpv6v/EZ08aOk4+YZMsdH+6xzFgXvNVDK3Xjw7CXAFCgQehFMWon3hOQMmxxNgZZhDIFCTpBhh66E2fcVZZKDBTVBMUMm06q+yxomB8FxaAa3ACWlud+IM8tUjLfVUy376IEx/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108612; c=relaxed/simple;
	bh=wzJvWLjTqiJYfQ5XdcRzN/rVMxfu+Qr9nqKFKHXaH7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDZ3utGcPDQJ6EYRJCUqHvKhYDDeFvM6Bv9UbSsc2yODrlevU8Jg6wS59HjGpAoCX7Recyg7/c4+rycloKBmv5iirxaXBPUf0VvsplhLMMNLHXGR17ITtkljSyfwy8cqnBDeo70QwkURujNa4Xde/UHdX6U2wEJ3ZWKz+v4gFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4V9CBt8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4V9CBt8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ede096d73so22334865e9.2
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108609; x=1744713409; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=;
        b=N4V9CBt8LeTLZKw/UHasWEl8yNkPhXfJ7BEWAS7P5pgb5qpc8Afr+tZmuZPNL1Sj46
         VPOANF+rKn6b/k5Ke6sOMYdVL7S9sD1Pf+XGmxkyWysHzw7AD3p5Cy3pxaFD5YRg/oKP
         aAJIqLvS5uXXOgvbfZEcTjq+pI+iDwFOogYKXAt1h6oS+D8SMn18uBRYt0hLuG19WYS5
         TVNXSqRkAncZ73Abunu4rXIK9wpMXnPSktGd7UqaOE2u4r99jPlp06/Qjvy9DeLapItI
         decQ/nfsKRx1V8cCJCWpBnhIQHZjzLAOudohrVHUsfrxiqJH8jtYj9oBa6JGRfvTplDe
         bgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108609; x=1744713409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=;
        b=ElWwW0R8fuUSoX4UOxu7+BAl3NjCFLb3XS+3ErDOKgnw6ipL2kEKwY6dqGXgvHaWFb
         be5Cv+qn666AGlc4cR0wNvR14EnjFyPHCcRsu5tyz0YrzjbIEQ+yQQakassVRFsf2Udv
         UBssvut7dPsX3w1dPA/d0lV8VlSadODRsyDFkLOuMDgmkvhvkiermm2DC1VWlqG3NMKr
         OYN117zWRnBiAsBAg+HyLkxlWELF/SXTfHC7XhMyloIjNLdj70yaRy6RxHtyBHYxNYxu
         VNKKIF7hInGXXSCYuBwucUaMwn+RkEcfdZmjyglEq/qrBDbxpCo4EGMJCYQPgdAefa/2
         W8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW0XxPTNHKuT5bbTi+yzpRRL896IpAbPdXI2Y07ItT9BJ1BAbuba33Leh7ngoHrlJoCfdQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH98hRPqWMDw5T2I8i594QoZkFY54ghDk9AUJjzKGmMPLXAaSA
	ZycD2iulb5Hm1lSFTLxFeML2RchiTsTh1XkQgOBpfYa4AlEfydv8ZP3Ghy32vTI=
X-Gm-Gg: ASbGncvL6JUYd9rUxtlghVLlZBLTACHaGjg1KWDcIHmFCa4rYVwoDaiToU6VL7qswKX
	e8aJPcDPuVY1HsgNj8Muf0slBJPeaYrhZ3c63MKFYh0wVtq23GcVz+rDeZcD0zFiLBsGRVN1dfx
	SytKw59WBWmR1IryfuySsGXf+UDOJ9mNCBc3eSxhha3oZGmdLKx8xi0JwWc3jDxT3JsW2rNHTra
	IzImKj41LSGHxJ7bNoY/MviXBcW12t6UfhhMKWWZOLu8Uzx37KctD2MSOZ+YXtKtHEW/ZCHU9+K
	x6R1rtz0nD20k/8QpV1J9hTc2evsXXQWmmKNrj43OJpU2aQKTw==
X-Google-Smtp-Source: AGHT+IGOw9Xy8oGk0GJfiu7VaitjR/t55edX0t5tshdnocYA+5fRdb4Pypir8G5VxuDaVk6MtoCiMg==
X-Received: by 2002:a05:600c:3494:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43ed0bc8d96mr155476115e9.9.1744108608941;
        Tue, 08 Apr 2025 03:36:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30095ea8sm14397521f8f.20.2025.04.08.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:48 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:17:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <c71fb862-85a5-42d4-91f8-398d0d532872@stanley.mountain>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>

On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
> +static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> +						struct scmi_imx_lmm_priv *priv)
> +{
> +	struct scmi_msg_imx_lmm_protocol_attributes *attr;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*attr), &t);
> +	if (ret)
> +		return ret;
> +
> +	attr = t->rx.buf;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		priv->nr_lmm = le32_get_bits(attr->attributes, SCMI_IMX_LMM_NR_LM_MASK);
> +		if (priv->nr_lmm > SCMI_IMX_LMM_NR_MAX) {
> +			dev_err(ph->dev, "i.MX LMM: %d:Exceed max supported Logical Machines\n",
> +				priv->nr_lmm);
> +			return -EINVAL;

This needs to call ph->xops->xfer_put(ph, t) before returning.

> +		}
> +		dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n", priv->nr_lmm);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

regards,
dan carpenter
