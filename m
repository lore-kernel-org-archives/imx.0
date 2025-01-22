Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0B212B0F
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 12:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737549708; cv=none; b=B5JtDowQOBnvy80I3WYGfWDz+5HjQ3qlGpAq0Fixaeagmdt4FD7B+UbbK6E7OlV9Vqf0wxuxuMCNmfNNrjhe+Ty5lqsB/rQGA4VCXdmsBGp/gDl/z/gsngK9V4U+2cCqAxf+cfppfaG3W8TpE6pwDyRC8mKq1lEA869XN9oVZc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737549708; c=relaxed/simple;
	bh=gvmqpricEpcg0Aj9+/F7NuMM8j4Q1897JU9gOAgFPL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSngEjMwrW45kp73rAZYmSaPiQQLMDwiLQxpt8k8+FG2ma4Nl2NGVRu7pibacNWOKKs7sTxy2THzbD6pcdgSPl/dPcVHF/Da8mTUIFXZI/OYEc1X3baD96yxbY00Ngro9bWHZw8LD5dbvrwE0QpewdGfg2SIUzBOBalEoUSl2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MR1fUERa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MR1fUERa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso47168445e9.0
        for <imx@lists.linux.dev>; Wed, 22 Jan 2025 04:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737549705; x=1738154505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=;
        b=MR1fUERa8ZqXIZYhSQTNOFdBJF1X19nd0eyLlRQ9/7VKSvchYlYbe+y9nK4AiN7N2V
         HKK7Ic4nlnDMf8JceSzF56WLVwxIEFgw49cdpVYyNgxJFbHg0GgFhkQTGHXnaJjbBzZY
         DvC2s5vmeFwGow9wZNSXMtaQJGObTpby1cDnb6dKtVOtRXr+Ij5cM3nLyW+/HGkfyJiE
         6NptJxOokufp/N+8b8UG1MBT2mcOayzcuqdFbXckXzvV2kbohvn/oxsqzLx86XgoqxKP
         FfZQeZEp12u+R0KgWuFfsTvt98PSp5zyTVQiSRdZixqghhAxN6kvKZucnwZ+R2tDLNVY
         hwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737549705; x=1738154505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqkiUxCJwEipzWMbLEZbrYeDUBAJLus2EzOeMcJUspI=;
        b=VhGmxdzV8kaJKojdP90jhplpqFNP9XfxpzwMgIq5rwuiMPDeOOIx8ESI0YHQwIuuHL
         fVCwyQaBYUTGNOMe2SQtwDmSflsIolAs/ZBYBGet8yRkHAdsGEc3ZuumVmZXv1ZysUBT
         +vAiXsO/Ptphy8SHXJwnXoeC1u6+Ds6mYDpbiqZkuAxJ3Rzo1UGnd1JhThmUg3lbf9T3
         4O/hWTF/ue5gCJ2c90k9RsbyKbocfxWxQpb6G27ifkhaGnZZW1wTf/KiWQXiUFZHmz1c
         +F1ajC50tR8cWOXgLlhp6S23Xi6epl3xJ65E/1mTD7aE8MoI2e31oi8s3FRprDVUF2dE
         AUEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQE6/nvkaUfzsqATZMPWxyAzpvCoZgldu/ZzOZhkxQ2tIUv/JAb08LXpCvtpoAFzy7kqc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGrI4WOAtyFYohxmCtf6deZVhyL1EBUn5HwZcjhT/w/lMTpOLz
	U16xF1zm3HICm97Mw0ao3I3l+7cu1H4b47TqsuKNtaYvpmBtw879Mww2iu0kjWU=
X-Gm-Gg: ASbGncvzldbH9fjMMSu0JEVbf5siSfzMVFKSyM7BN4BgM9Bud014k3Nkxqt1R26Ex4R
	HjI4QQ/XGv9h9Y0MRzh9pOOpfDBNrcHjg+mz5iKLnQnDS9dxK35ylFkXWDMgklh3truuHM5Pk1P
	BD2nXGrdIXoQzVHWNfeuAbHh3Y2Y56VV31JMGaoyf/v/GRUpXDO8vj+WNLL9y9nVeNyySeZhEYJ
	wTG271jHjbwxhKvc1ohzyuJ/8fMMK8ZsKNVcjMGE7CxaIBzkQ91N625c6XCOUgGobq31MzeRJY=
X-Google-Smtp-Source: AGHT+IEA2+PefGbBDd9kf5Ode3Is1wr6+YVdf3H9X/PUUkYizot9mKm50rI9cF5I9tp7GaNN+guivw==
X-Received: by 2002:a05:600c:1d28:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43891434081mr186013305e9.22.1737549705023;
        Wed, 22 Jan 2025 04:41:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3124a14sm23456405e9.0.2025.01.22.04.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:41:44 -0800 (PST)
Date: Wed, 22 Jan 2025 15:41:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <ac1a1ebe-ef97-42a2-a2be-529a656a7706@stanley.mountain>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
 <Z5Di-uU52aejU-U8@pluto>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Di-uU52aejU-U8@pluto>

On Wed, Jan 22, 2025 at 12:22:18PM +0000, Cristian Marussi wrote:
> > > +struct scmi_msg_imx_cpu_attributes_out {
> > > +	__le32 attributes;
> > > +#define	CPU_MAX_NAME	16
> > > +	u8 name[CPU_MAX_NAME];
> > 
> > char is always unsigned in the kernel these days but strings should
> > still always be char.  Same thing in patch 1, there were a couple u8
> > names.
> > 
> 
> While it is certainly true that char is the way to go for strings and, as
> such, it is used elsewhere to hold the resource names across all SCMI
> protocols, in this context it is a field of structure representing
> exactly the layout of message reply coming from the server, and defined
> in the SCMI spec as a uint8 array, so, we have generally preferred to
> used u8 to represent such fixed size array all across the SCMI stack
> protocols implementation....
> 
> .... not saying that it is necessarily completelt right, but that is the
> reason we are guilty :D

Fine.  I don't have intense emotions about this.

It does slightly bother me when we assume that the SCMI server NUL
terminates these when we do things like:

	dev_info(ph->dev, "i.MX CPU: name: %s\n", out->name);

But from a practical perspective we have to trust the SCMI server.

regards,
dan carpenter

