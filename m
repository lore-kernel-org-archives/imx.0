Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699122F90D3
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937936; cv=none; b=OcAeu0Re511k8zYAjnx1Qess/F8VkvHT33bHJS1DDeHvmMhWTtuBbhU94AT+Na9NzuO0Y4XaPkMRicw2kZETV3sUmrV+4w9V6tGO7kHrV6nfDT0g17wKXYDzLcOMAvJGFA/iTUFLzk5QeTTR8wb5iHUcjjyCjN2YUh+saPmmQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937936; c=relaxed/simple;
	bh=BvJ9QOK1WudzEqe/mVP9Qch6KeES8Cz5wJTG2FvjEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXkOaYlRmlWA1r6V/7hJ7wczpeSk7X93j4j02PnpkIi+CWxKCsYC+vJTBZMFrMcb3uMZ4Xf0sfNAIEsbP1A5WlTfWj4S5KgWObzF4VqfVkWqxs6oGd2tyGBrgYPpAIa0yzyGDSK/Ek7680kG2/1W8QSSEsffOtF5rCq1V4ejnTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2x+NhiS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2x+NhiS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47777000dadso3648645e9.1
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937932; x=1763542732; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=;
        b=W2x+NhiSgw5Q+aJ4d5MTfqkN6bhQh28GKRxOw5TSf3sbQX/JjgaCYf75rVgd9rK7jD
         lm3vMuh5WnpNqTmtmgnFoc6ThNJO364jEIlKKkaB2awABlAE8VK14g5N7OCtQ8ZzP7lK
         e96WBFxp8AeZ+N7S33mR0OMXtGpoCnM7Uy59cjI+M/LF5oNy8YDv59s8PuZrz2umWXAH
         bo3YYSKPgWC+Z7mZSOBtT+HP109xzRUGhQOzyAOTR6/W8UvDAwtX+tp5D0iokNpFFcjw
         bskuo2HvGefTf/ivajhMtK3pxlmUWsi0IHS4b3PqIo0jYdPO1VLbJBTau6ZPBcI1EN1c
         nalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937932; x=1763542732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=;
        b=ap61hMzLDuzh5gsCl4sZLtUl41ArF+nyMz3YJ25KJ2kyTB9uy99oRYgn1BMY/32i2x
         dstExJdUswFbh7GfHtiA7+Mp+JXLe//xAOKitSb2DUyJg/ix0Ek2YRVg5OyrIRmM668F
         okuK+4mvKGcnSD7ZIXU23vVYS7OoTRvkMlW0Qc/VfK8Nm5Bwa/3moMoyQzEAJPJxTAbZ
         clTnonkMzgw5fX7OgWZ6DN5p1HsaX/1REIz87OwS31R25dqiGT/r4QkBpjP8IGlQPUNs
         Mf/FgEwOlNw4PKrDP2NUEwkIWz9pFGhczwhaTvQbklcjoWfFEq2Y7DJZ2YUp6p/GThpm
         thrw==
X-Forwarded-Encrypted: i=1; AJvYcCVXO9s9epyLjKEuuIo9ijMdRIS2W8YFLz/M4XM7EBxXEeWVRR8z+maqFx/sJE++1zP7+Fw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXJ5Fg9xd1TGzVaUyNTF4MevJ8VO3XJQqT7qOAkQ9iRSESBC1J
	qWegK8dXpUL2f6M4APzt5n5/kfeqtjsqJRLet5dHwq2dugYEyghKuncNSLytFP3pntE=
X-Gm-Gg: ASbGncvDj25eP68rjQ6xw5ZL7zG921/eE+aYpvU9kN19fNNTDQAvx4AI+8JQHisbYGj
	fzR6G8IkDOhHICOeIuTEtskv5mHXieWRmQ22G3hERApIY+eWhm0p8T4xzl0QUZqu8+iJK2VjqDX
	cznlTnde/idrWHPXkgLTw/hIUQILmBtXIvAnqF7+aJoQf9CR8RQjb0X2Zti8Lbvn2svv76YhqkJ
	riIImdPE8jqEkJhKw2HarWsJYOwacklZGtlwZEX0PHHi/6ZuKEKZSwyYDensBnw4Oqgc/IDoV2Y
	57KX9RlBGQoO52hz3tfvI2T8RZSLO7gv2NBIA5iDS78cZOC/o/B/9xjSmnyHnJuYwiaZ/SHqrz9
	Lthb5yz56aQXpuiNVtotCP93c/lrYhm49ppzX5PkNO070zsTosZSt4ZV6837SljvlKoAmlD2t
X-Google-Smtp-Source: AGHT+IGGVYvDUcqcUiPZLSUtoqDWfq0dWOAgjoDY5T7sj0q34JOuNXmckY/tBFbuwEb7ShY09sMSJg==
X-Received: by 2002:a05:600c:4703:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47787086800mr14036335e9.26.1762937932076;
        Wed, 12 Nov 2025 00:58:52 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e48853sm23640245e9.6.2025.11.12.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:58:51 -0800 (PST)
Date: Wed, 12 Nov 2025 10:58:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, peng.fan@nxp.com, kernel@pengutronix.de, 
	festevam@gmail.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: imx95-blk-ctl: Fix clock leak in error paths
Message-ID: <y6ospgarjnretdsankhgtudttqqjfhltjyt2u6hnejgeufbkcb@yhk7ejuexvr5>
References: <20251111114123.2075-1-vulab@iscas.ac.cn>
 <20251112023025.793-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112023025.793-1-vulab@iscas.ac.cn>

On 25-11-12 10:30:25, Haotian Zhang wrote:
> The probe function enables bc->clk_apb early but fails to disable it
> when bc_data is NULL or clk_hw_data allocation fails. The cleanup
> path also misses pm_runtime_put_sync() when rpm is enabled.
> 
> Switch to devm_clk_get_enabled() to automatically manage the clock
> resource. Add pm_runtime_put_sync() in cleanup path when rpm
> is enabled.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Next time, please do not send the new version as a reply to the old one.

Everything else LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
