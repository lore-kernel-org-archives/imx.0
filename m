Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCE015854A
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989006; cv=none; b=VWo+BiJOh8fn16Rlsfbd0Mi3iyIVEhmu6RYnWom+gET3TL+tbiCqyf35bT81AO6Y85a0p0SJNdAfcOYWuCiiMvcudkoZOtXu5LkCff08D5mpVpQggiVtmsCcB2EKROWB8OCsYKhSUsUfeBCrWfKXphQHmFclo9fU12Pid6FyVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989006; c=relaxed/simple;
	bh=jXmABgKlTV2rT+eRZ9rrvS2Qs32wSTbnbdHdyY3i1zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYL2oI/0nawxXT/vT0QDJVot3EzXRyLMf7w0Cl6oW9O7ZaozLuZE7qGeQuLZal/Tn+qfJDK53RX4ClcwZCt85w0cjzTi7sp0lueVupj0tQOz/i2WBM6+1Wwh8Ax43BcNR/2RnKACC+QuVPBwX0JzYi9XuV4DjOlND6Dqh/vp6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIb5M+LI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIb5M+LI"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e4cbade42aso5995868a12.1
        for <imx@lists.linux.dev>; Mon, 03 Mar 2025 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740989003; x=1741593803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=;
        b=UIb5M+LI68HoUY7qCW+m1wEKdlbgCEaYmorHSSmoe7BQ9nj/FAqQwZqFEudBVDknZW
         a8W+oQ80WjrIuQ1TmX8OrAxbgrCFojR0shRgaA4AKN/ItEM3bsSAMNQekL1cjLRbBQ4j
         aAt0U4osaufRbNkuunSkK3mnEFyAUbN5rX5kh2KZxC2bW36MhaEdpgNj0yLH6IIaW/G9
         Z27TYFNCoX8T31M5tktiO3BvzmMUF/q/L+wNu0Inylo7MOCb992f/f+djpQQiptMXVY8
         rZEVnFJkGIhWDCDMnGXKj6Zxon3EbHshLXYNrwtkmWHOVrFXH3GfS1PLx7JABGLE6DH7
         6GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989003; x=1741593803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=;
        b=OCKN0hFsfg2/HBLwd3o8PhhKdOjpvf+vsL3XDYJNUZPVlmzjNhpVkVCLT3Ui6/ugEP
         ZH7q5GkmWEWzHR5QbotifkMJMHOaKzJhTsVwsS+qliiYWQpRdhEp41aKr8eUjvrndKY4
         YIl6lKr8QuQD8VZw8+JllrQ2+yb26F7sCtkhOi+8YbZxoBF60hqYbmrb//Huear0j8MG
         DmamF+1FCXBJzXJOeNqiSqLyGkEbdtPDe+bjCMNY5AVSa2kcpAHc6aulrbRgjvt4Es6/
         53rOHKebLbA3lsLi7gCtoMgkbuuBZpUwc3Cd160lGB001Ri81aG3RPmKZ2sZSZkB7tzN
         y9zg==
X-Forwarded-Encrypted: i=1; AJvYcCWWSGpppio4CmGh+P6FtgcJnICX847PFr9pLrzz4W/j83j/rcDiOJ68U+jclnPUsd2fGiU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZjX0694xhLD3H9S9zd4+IKy2r3wjUdD+4F8M/Jz5w8yzoC572
	fORUGpeL9wqJ4EuzBwmnOlmtChk0yz93o8pWX8yBsG1gIBEeSLwRPD9GTRvcTHA=
X-Gm-Gg: ASbGncsgIbj229XHB0t6D1Wxhwd3+ythwaEJpzvrV17SwMXyY6wKAoYyErKdLO09JYi
	t6MghGh3SwJB7WmZfjXWzV037y+lJo6dO9yjH07owRtfkCC4H4rga3zt6w1B+BEdbx2zuxwwbtL
	f4+ziNxZu42sdlgUFI76UnxSqcWparZsZaklc5iYDK7egpoNsHAbYLz2ZDgBnjTWAt7uAng3ENe
	ebgk4bjgYZpbvQFcplUEO2Mu4k+Gsap8wwhgZ03A82UNkWNy1wmHNTM7SZeQdEcba1zVRImKedy
	K8AL/FbL3Zr48b8bV2hai1GrsS9/njKVqCDdv42O0y7ufUY84g==
X-Google-Smtp-Source: AGHT+IHSJwyoyFbSkRa1UEg1HQ8PZPp0oWijLI/xxUyJmjC4df5Zae4YdAsynhyaSb+1Hid60bmPNw==
X-Received: by 2002:a17:907:7f26:b0:ab7:f853:1445 with SMTP id a640c23a62f3a-abf26883e80mr1335907866b.26.1740989002624;
        Mon, 03 Mar 2025 00:03:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c6ee730sm764757766b.104.2025.03.03.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:03:22 -0800 (PST)
Date: Mon, 3 Mar 2025 11:03:18 +0300
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
Subject: Re: [PATCH v3 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <2c8e8e93-4ce7-4260-94bd-eabba0b7732d@stanley.mountain>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>

On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> +static int scmi_imx_lmm_attributes(const struct scmi_protocol_handle *ph,
> +				   u32 lmid, struct scmi_imx_lmm_info *info)
> +{
> +	struct scmi_msg_imx_lmm_attributes_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_ATTRIBUTES, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(lmid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->lmid = le32_to_cpu(out->lmid);
> +		info->state = le32_to_cpu(out->state);
> +		info->errstatus = le32_to_cpu(out->errstatus);
> +		strscpy(info->name, out->name);
> +		dev_dbg(ph->dev, "i.MX LMM: Logical Machine(%d), name: %s\n",
> +			info->lmid, out->name);

Print info->name instead of out->name.

> +	} else {
> +		dev_err(ph->dev, "i.MX LMM: Failed to get info of Logical Machine(%u)\n", lmid);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

regards,
dan carpenter

