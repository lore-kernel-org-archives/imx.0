Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2791773D
	for <imx@lists.linux.dev>; Mon, 27 May 2024 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716796877; cv=none; b=Y7K+9cUrgF6p/9A0j2e0AMqyHjPSua5RVfcNdw17Im8MMI25D6rL4mYMrKOMcixAVsMJyrMdcH6J21K23AkUD5XdV3BgGMkUIiouGfISOoPMKz8M07XNhCo4toLBXorUSgx6JJ+oEo00uGvbJdemDo1kc5nkogjNichq4+Ll4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716796877; c=relaxed/simple;
	bh=KGYzo0d4ydTiDRoHwUaveUva4TGHCiqn07mQdn+93U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mia0AYPrC9jYQsd5pGX1/qBCJmQqUkR3k1f4VvvRaTfoYTs1Km+yNVoBPyXUuBbXJXFsoHwAQKZ3bzm7JOhzY095dpDcpLtd7y+eoH7JKG5esJAWlxbci3GeJR716zCuZaasGrYhPHgKdOuiTZnuVQnJCPE3ZzNOt3Z/NQFyG64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OgMhqJyS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OgMhqJyS"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5785eab8d5dso3004899a12.3
        for <imx@lists.linux.dev>; Mon, 27 May 2024 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716796874; x=1717401674; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVF2aDiAwuR8zQRgdtvjMogqVM3XbukgpjZURs9F6bg=;
        b=OgMhqJySR9ZFhfcL3weGjDzYGQa3T3YU4v/g7CIuNyeYFVAo4zyuhxE3+6mB+4t4tb
         qPhvofsyad/ESUx4VVE0RBNNVir3UGT+OzgUkySuCT2jpn1VPWhsF/FsoCnRnKuCo2Ao
         ZylLFirzBGJDKxguzB+V4WLCdZjfBH7nron40QUAY1/pgRelGnAqktN+VUVt4Ut2TPR7
         D38hHRp+4ZNGsWEffi4jfsC8ptMFhZFBaOJaDrXfc1XLlaPvBKZueEZiF2JdAG13hsni
         Ynp+91NGSwnvGEYH5r1Y2cYK71b+SSt/ujcVo7NyDKf/qiKx3nwKYZgEWmpVAXctvMUQ
         e6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716796874; x=1717401674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVF2aDiAwuR8zQRgdtvjMogqVM3XbukgpjZURs9F6bg=;
        b=PYmSFWCZ8lVDUWh+hclmMTf12Pgabs3hUFuACH/qaiaI0pe9s9zwxlN/W8yIsXwi7J
         CVTsrQUV0NTMnf2LJGGNuKi9PIGWMVeA5WUa93HdxNAYSy/CQcC2FfIsRhaliZ9IbJ67
         O9l5AhmYS2OScdDeC4BIpwledNVFC2zEc80YglizLrT9Ur5Vk/p4AGPifQQqO8R54ZQ4
         +mPmrSgKL5NamhXEzeJdzlqn4RNV5FiK0xOxRCSCpzP7ltH1+WhxUFFKcH8aYfgvyZ0N
         GwTtX1K3YDfOxeWpMDNS1EgLz0+Gtg9NrgVWviYHUQLLkBoYrnAzUeoXUMylCO/OKLvo
         AlaA==
X-Forwarded-Encrypted: i=1; AJvYcCWX8XcL/lKkzL8s1eynJQxA6jGEyRVbwmvcSNapG71ZSjlo6/I+A/ZoDURsD69KW1SaNngKbrENUTgSLIXSZOPrNxgD
X-Gm-Message-State: AOJu0Yz3kULDfFtj+aAk7Aiw3E3kQnIOUaFQBJD2RlkM2RvF0lXBt4iG
	Fzdd2hksR24HDrWC4mjwnDnfWor5ovKBJLshGpQ2MwaEqXbbChzwoAWcYMAxoZU=
X-Google-Smtp-Source: AGHT+IFQsIh5kK+9ePczG/hmYzE323NUpoIVFMaCMZbZuQdBUucEYG/RX82tMtIPJFmuC6hg8bvxxw==
X-Received: by 2002:a50:a417:0:b0:579:c442:3684 with SMTP id 4fb4d7f45d1cf-579c44238e4mr2204315a12.24.1716796873691;
        Mon, 27 May 2024 01:01:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578523d2507sm5443603a12.40.2024.05.27.01.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:01:13 -0700 (PDT)
Date: Mon, 27 May 2024 11:01:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, marex@denx.de,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
Subject: Re: [PATCH v5 2/5] clk: imx: clk-audiomix: Add reset controller
Message-ID: <7ee00c15-ed39-4092-be79-d4683d1c3ee2@moroto.mountain>
References: <1716458390-20120-1-git-send-email-shengjiu.wang@nxp.com>
 <1716458390-20120-3-git-send-email-shengjiu.wang@nxp.com>
 <Zk+oxAh9+c0RIQ/t@lizhi-Precision-Tower-5810>
 <CAA+D8ANOQ8Pgt8QZWduZoVKCcb8Mdc=Xzotu4zAqakTjHO8pBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8ANOQ8Pgt8QZWduZoVKCcb8Mdc=Xzotu4zAqakTjHO8pBQ@mail.gmail.com>

On Fri, May 24, 2024 at 09:49:08AM +0800, Shengjiu Wang wrote:
> On Fri, May 24, 2024 at 4:36 AM Frank Li <Frank.li@nxp.com> wrote:
> > > +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> > > +                                                      struct clk_imx8mp_audiomix_priv *priv)
> > > +{
> > > +     struct auxiliary_device __free(kfree) * adev = NULL;
> >
> > nit:  *adev = NULL;
> 
> Actually,  the checkpatch.pl told me need to have space after '*'...

Someone should fix checkpatch so that it knows that __free() is an
attribute, not a function call.  (The cleanup.h stuff is quite new).

regards,
dan carpenter

