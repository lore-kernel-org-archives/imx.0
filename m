Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3030C10C
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161538; cv=none; b=aAug5OFsWe065/9NQy2neM3jY+Ly0ZYAA2TW/RJsbGN1GMqgixg0IJ5uzJ4WOGRw/dhK0YVvE9y/89enf777dV/3msBqWOS7S26NdFh7xiiY2Vv5Kx5YmxsefOVjUVWPd6c3vHU7U57PeIuHY0/hR4J/pu/Dkl09LbAeVi8XIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161538; c=relaxed/simple;
	bh=9ZoQEWBSlDHoAaP3uTh3gtYfZh/RbiEHvtLwh/dwqqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BUNS872pQsB3F+vWQwZoRJIbXfnPO3XU1BnLiQTWTAhlbZ4u6OrQ7ZrsIB+tp+MWUTUnUkTp13etEQMXDZtWEX0dSOrDQ/cewnqFJm+Vq0OQof9fP8ob37lX8l8X+JSu7TACwJI9CVrX7yOagw6oIfBaO7r6LFPLO8sH4tc7zrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eSrVNUfU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eSrVNUfU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2A161C02449;
	Mon, 29 Sep 2025 15:58:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6699606AE;
	Mon, 29 Sep 2025 15:58:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7569102F198F;
	Mon, 29 Sep 2025 17:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ZoQEWBSlDHoAaP3uTh3gtYfZh/RbiEHvtLwh/dwqqU=;
	b=eSrVNUfU2kbyx/WmNGHNJQO076LcrN5+0X0skr+i19j0jj+vqZPoeDnSW+FdXqNzTzzFrk
	qiBavXTsCEE4/K8d0oDtfEpCCnHBzPFobDl+uAmcHbGLY4ASofsANpodQyyKQVpp+9K4DK
	qVpVwXkN/Ye6JE/E1hgbU+/u7a9Y8XBO/iKLZP1J0BfxzNDDZqmvX+7hZ6GQsvmyMleqLb
	aM5FcyZfIfKtDxv2iUae0itfystZH+hnH8LRc8K62GYKHv5HVjB/RwoMgLU7uPvZSvs5lp
	zk5A3dQIsm3wNfExbCPSugUqdC77qZppBXvYBr4gmB0oCKf/ScKkSi3wMGdVjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Han Xu <han.xu@nxp.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  stable@vger.kernel.org,
  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N
In-Reply-To: <20250922153938.743640-2-maarten@zanders.be> (Maarten Zanders's
	message of "Mon, 22 Sep 2025 17:39:38 +0200")
References: <20250922153938.743640-2-maarten@zanders.be>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Sep 2025 17:57:50 +0200
Message-ID: <87ecrpi741.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 22/09/2025 at 17:39:38 +02, Maarten Zanders <maarten@zanders.be> wrote:

> Commit f04ced6d545e ("mtd: nand: raw: gpmi: improve power management
> handling") moved all clock handling into PM callbacks. With CONFIG_PM
> disabled, those callbacks are missing, leaving the driver unusable.
>
> Add clock init/teardown for !CONFIG_PM builds to restore basic operation.
> Keeping the driver working without requiring CONFIG_PM is preferred over
> adding a Kconfig dependency.
>
> Fixes: f04ced6d545e ("mtd: nand: raw: gpmi: improve power management hand=
ling")
> Signed-off-by: Maarten Zanders <maarten@zanders.be>
> Cc: stable@vger.kernel.org

This patch does not apply on nand/next. Can you please rebase on
v6.18-rc1 when it will be out? I'll take it in a fixes PR.

Thanks,
Miqu=C3=A8l
