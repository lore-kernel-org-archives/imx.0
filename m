Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8621E6DD4
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504966; cv=none; b=g7/4REGKHhZQC/a8yPca5bbIrZS5hScD6B/OGvgK8QHTHvkRFA4q4fxWjKNTvqCbES2jzPVILG/29CNJ+4tE8GI2fmJuIGSZ82mi155EZT3b5q6bG3+gAmghht3w1WX80mSTWZlZAhMkPDQ5KBSkv+nyEZUeGHNaX04ncTMxvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504966; c=relaxed/simple;
	bh=QnO/pGqKy+SdwSwusnNzSGBFs6gdUebQGQ7JLaPxkjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdz+fmcfBxLTgT+prD0qz0+PnRODa3R/wwPorrGSF4lx3zhSRREPeZnsbE+Mf0Qz2e845CD+ayLWDJQvmSELyI9Naz2aKbm+KeVXfAmkXLvioqfZAX/YxXJRx8ObKDQTV5RUxSHRyJ/bB8VTy31Pg7Ebo1upNN1fsEgXCFtkAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nVvlQPAU; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nVvlQPAU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50C56FF813;
	Mon, 21 Oct 2024 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jt4ag5MKyMd3xgYncsPFdm31U3M1z0irrsL8f/DQljI=;
	b=nVvlQPAUCCdLBIJWZ9hiWMraywkcDWO2Y0kLB4GGWQQOQXTL1UpZkZfS8JHZlYodhZsAMc
	JELm0CH5+uoebbZPgy1ktk7KdfNUXJVXghPoApSp4QoK+5MTim2ezKjS5BrYcYn8wLpwOS
	TOR+J0o0U0y5dhW8tgC+t9RcPoE2K9lMm6YoRLhkMyaV1f01gh3hpWsGSte+AnBWuMZ0X8
	kT4ZeiJSHGaApwvItirBExtns+esL2I/wqjNI9oTPmj+XY99eXoZUF0bvuuc7PrAzWDrsA
	yLT0+r8CL9HW2o9giaap/EcQ9zNFnkIW5eUI18ltuGaqbRebgLkBOMSoM2aTlA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: nand: raw: gpmi: switch to SYSTEM_SLEEP_PM_OPS
Date: Mon, 21 Oct 2024 12:02:40 +0200
Message-ID: <20241021100240.173393-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007191319.220775-1-han.xu@nxp.com>
References: 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bc1bd939c4caa57a421c8cf3492140e2820a4860'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 2024-10-07 at 19:13:18 UTC, Han Xu wrote:
> Replace the SET_SYSTEM_SLEEP_PM_OPS with modern SYSTEM_SLEEP_PM_OPS
> alternatives.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
