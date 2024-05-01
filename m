Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F37C082
	for <imx@lists.linux.dev>; Wed,  1 May 2024 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714564480; cv=none; b=YO47QYsCzkpLNWfHvMxiBHO6svU7UBtmYrsv8wkT8GEKvmJw5AU+cqI8ccuChrF2LK+YpvdqQgZsU70bDP0iFN1jlJCLM1gQgXl9IKT1hrr81V36zeIaTftncOt3tsf8c6CfNIJr+HcR0cMxGfSaX7h2GWzUsIud20GXZaE4/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714564480; c=relaxed/simple;
	bh=VgLKkmgQwkz24VDfpIkR7Ysk2CwmG6rtIKGUvwJr2P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbxsoXrK13YdlMLIrpjDDqXbmLrkfw9X9/SlBvtwblomVH8Pmh8CT76dwJAG5QXwnSjREt6j4pkCNepd9CcO06zGTZMNBp4hNA4iC8V7cesq5CV/iddZqGInH/h6pOjgBatogkPPLwvYS+cvvDXAfPNunPCV2/cOLtemtXI6uRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpmTphGw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpmTphGw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so8414851a12.3
        for <imx@lists.linux.dev>; Wed, 01 May 2024 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714564477; x=1715169277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWU5y5fq+7Sh/5YAl7I0WzeqGM8D5DqoKBNmDtAfIbo=;
        b=KpmTphGw3eTLCoh9mGNwsCj/8H1Om8VZUVw5TOhEoipCjo/tVEpV9QDvCv+cSKAk49
         DdlTYTSFitHdS7AVid8xzdZPmTOxysl0eXY1fLRSZv6i1sk7ogFDoCi0Z4lvfBLRL/vs
         2k3jCLZdQFJPxtep/9mH0mOFztN4kxMUMkFa+Xd6ZpF55TvCDoY0hn5cH0USqaok/Zwe
         OeMm+6QxRU/pPQ/E6CLsOucDCTeCIrZlhPbLiaN7wABBdgPXnwHmiJKqsbIVLcbN/Sde
         rK1+ShT1214EIOVNN8DQkMrrUPf4Wp7ImDbxw37it7u34vgmEot9u0+1bpoQYWgE+DYE
         GtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714564477; x=1715169277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWU5y5fq+7Sh/5YAl7I0WzeqGM8D5DqoKBNmDtAfIbo=;
        b=TJWtrnetU9x2a6cwRLBRFuoy3E4PaGfhEZqQjt0lzdItonnDnbYSa53xZHPafS1BRC
         zG8lxSqrYIhzDHRC0xAhEWnMA3Qx3fE2h+ybkFi7loyGNxMpHO/+RdvljI+2LPTkXN2U
         CmY1zRk9Kdxyk5qZtIxqmfg9nXYrSVmmNI68DbX3H0j6vgCo1w9Kn+4F4kJgaDHZ7Jz6
         H+l8gOBl6PxVNUIKnd5SGxBE+mFZBGGKvqMRyureAnjEUQchFLQ6QYkpVweXaqOKzoV8
         gJDnOHD/58Gna9fCXVQeOBVf7lgQUNnrpIRcriNbjesQcLZJDup7k8sywdrihuM9Gpm3
         LswQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtojDoIpsdEPr2WINdeevO2t56Nob7G35nrSEW29fktKK9MKLG1RMbSBcjinuw+wCrrypSsC+UbFZbUFqJIiWxtNVF
X-Gm-Message-State: AOJu0YxyGfWO/BjhwrSWr+HSmZKIwRCIfuFxEHphvhECOUDwEZa2Ik7/
	6NkI5TpqBLtriOJk/WvII4tVNzpcxxz5OL0G1yweZ/Czt6ppxZCVw+svruLzuz4=
X-Google-Smtp-Source: AGHT+IFvuGfM78B72ca+Oa4xepiLh6v1yafhkqQhzAn8IImg9PFRUyZjFCtX26ZD8B0uUZkAFvpSgQ==
X-Received: by 2002:a50:9b59:0:b0:570:374:d6ab with SMTP id a25-20020a509b59000000b005700374d6abmr2113395edj.3.1714564477326;
        Wed, 01 May 2024 04:54:37 -0700 (PDT)
Received: from hackbox.lan ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id q25-20020aa7cc19000000b0057203242f31sm11334987edt.11.2024.05.01.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:54:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] clk: imx: imx8mp: Convert to platform remove callback returning void
Date: Wed,  1 May 2024 14:54:30 +0300
Message-Id: <171456445302.602991.15999220730191213802.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
References: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Apr 2024 09:12:31 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Convert to platform remove callback returning void
      commit: f5072cffb35c122ec85d91ef327fa8814f04297b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
