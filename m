Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F31E25F9
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466560; cv=none; b=L2q9qxsbeXcWHtzPbsnLffJUA4mK0VIM957fLiBuyaDMasossGachwcLXlEXWg1tFgZu+JOHAbUw+JeZxXY6yApXvGlBxMuCwBrEhKz5LKVZ2iRAZJ2F9mykqGnwGLXlQOQQINY8aOpKIKaqpN7/xNKmsAXpAjuwzlFGOSd6cb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466560; c=relaxed/simple;
	bh=VUL6Odvz2BGJmEiErMIp7g1YPSC3jt6JjrwwVLc52zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IaZvLDSDl9h3pHEoeN0QtZztvBSRfGV9e1WhoCF2BWVPpAyRjSCBdboncRibEf8qiLr/dD+js+1E9cArDEqZUA8/+eEHarR/5tGUl0l9BQHQPTFULBUYVjKQJ4N+gCx4ADTMc5eGXhKW0rGy2plMjOrjSUK5BxZyFBcZJtEX+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtYFoFH/; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtYFoFH/"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-121bf277922so852385c88.0
        for <imx@lists.linux.dev>; Thu, 15 Jan 2026 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466558; x=1769071358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUL6Odvz2BGJmEiErMIp7g1YPSC3jt6JjrwwVLc52zk=;
        b=EtYFoFH/S0HzLZK0gK7K+p2Byv++2oPJ+zKi5mTURHQlkBgJqnYcBzbZY8PANjxOeR
         dxUKs/6UtzUKzMe2/UFN7UH+33faMykX68NPY8Q2ltLQJ4Djq/VmZJicJEE2hYl6wPP8
         akI7g1Veju2gSpOlwk46nO1KNi2MfCQJyZU0WlQkLpxV1Z5vPH+PBRErIa95W4fn263R
         BzZaNeBFRYJMwVLvcYKhZt9NEFEmWYoIOwJd0Di+4aCb4pZGNVKFjWf6vU6BNmSI/Y+9
         lpZPLAEL5eNH/v+3P+eGjlsO3E20aYtzP83IZ9/DahDMyic1VL0tK+xS3zv64prpVBNy
         fiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466558; x=1769071358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VUL6Odvz2BGJmEiErMIp7g1YPSC3jt6JjrwwVLc52zk=;
        b=CAnPE/9PMD0J2lRBlww03REsezD80bzNKsmNzTOCmPggPyIZM5w0UFmJ6sz0HIh8WU
         cIPwejoSi50AmvDbKzK6Tlf/+WEsxuYdB6llps84KmuY1wqVjII6LQ5M/+gqgByqfeIa
         SJkOPULC2o/1akhrk7uGc/Y0IpMA8fzZzfwMaqLPsRSdg0On09bkk163zdgZ4p6hZeK/
         O7dM7g+a0bIU+eJMNyuyg76aSrh+tQ49cdwaflAeklaVZQKyOT4dCy0aTf+yUn3uiUGv
         4h6dxM3ESJLezLn/stQi41yU0rEx4r/OdOQKhSB/uUiU0fEvtcV1CRDxZE0dUTWNZWgn
         2FiA==
X-Forwarded-Encrypted: i=1; AJvYcCXO9p6grlb8B63MxzXl4FjWcoTBICtAAe+Ow+b4p1yVBnNDPdel2pKpb0Gfy8NXrxA94Fc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRviln69qvR4aSZxXo53asTAoIGUmtL85IWAa1OuytguO1zNZX
	wes3qWcZUVKJQPY5AnsjDy0Yil5yQArM1uVB82zT9Bmw2M8a/GnEtGnMOhpUIl6gTVgUqcx9DEO
	+7HJoWgI5NnNV4puHj7p6i2ulbbEW5Bc=
X-Gm-Gg: AY/fxX5NV+DsrU5SYHGIeuxu8US71MhSSa0EK+fQ6GtAf0bBIQmyiMVE3LMXoWJTP8L
	4BokHtmZwjIrSGWMXIqJrX5xnCxv59E14MEF3EL/w8THIu1pHtK0/4VSY5pcXKrfdVehh80cuFL
	rlbWQ6eRM2f29u/G3gKhPkNVi5TJ1ImMroQWHoEK50fZpKJy+kEKzy2fGAfNHMRiJo2N8vOmm5Q
	qvFVYTlOKkYbnAVxaW4WSnE6kqjZjrokvRxagKsU1qqjPzmdqrvw4VX3PZ4a9mAXua+Ziiv3wVO
	KxNofRNMkgNwJdv1drAKA45NsryYR8B/7eDg9mE1KeufCDwCu76Iy9wRsHaQ57J87Z8rVxLXk38
	ayLqmKk6y6cPuwy8ka0/b
X-Received: by 2002:a05:701b:231a:b0:11d:f440:b757 with SMTP id
 a92af1059eb24-12336a8ac7cmr5154017c88.26.1768466557874; Thu, 15 Jan 2026
 00:42:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com> <20260114-mxsdma-module-v1-3-9b2a9eaa4226@nxp.com>
In-Reply-To: <20260114-mxsdma-module-v1-3-9b2a9eaa4226@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 Jan 2026 10:45:18 +0200
X-Gm-Features: AZwV_Qi-TQ7lJMIQ3JWU_HIrOBnLtQtdsWIBSjxYFap9Y2nvd_jWRPWPx5vtGmI
Message-ID: <CAEnQRZBe5Q2Ejbf_-+Mo8zTc=mSDgpXuXbh3NVHcwjooggD0Ow@mail.gmail.com>
Subject: Re: [PATCH 03/13] dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 12:34=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Propagate the return value of of_dma_controller_register() in probe()
> instead of ignoring it.
>
> Fixes: a580b8c5429a6 ("dmaengine: mxs-dma: add dma support for i.MX23/28"=
)
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I think you can send this as an independent patch or at least put it
first in the series as it is a bugfix.
