Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E934321C
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667171; cv=none; b=q1O1GtyakJlPfyFBrL4L7PX6wCO4Q5LX87HfNx28rh+iZQKQhJMa5Lw8Kz9Br3aMx5DMcn+QrPzZn+LE1vY/tEQFQfmwc6GGm2Jpwu66obg4NczKS5LeUbbvTXLDvRkFS5M9OrlwOQJ3b4TFnYTKXm3vE1Xa3y9qu0zL/uB2HWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667171; c=relaxed/simple;
	bh=3Z9B2J0h6xxqiuwnW3cJtiQmcSz0eO1HA1FKGKZrxDY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JBCS6QYzTQ+7+DSVISZr3/g8DlBou8gkEcAOy8EimVujuxFnAhLJ4nic450Ie3kvOlm9aqhmrxb13Vsc7jhLI106Ak+iadD1QGL5zxlDeSY4hpErTVbykzzwTkobfxpnO3d38RejlrGtHgB/VLSeRDhwKSJQm7oEFHAEZEJMOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vuawdEFz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vuawdEFz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D6254E4139F;
	Tue, 28 Oct 2025 15:59:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52681606AB;
	Tue, 28 Oct 2025 15:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9911117A9A2D;
	Tue, 28 Oct 2025 16:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761667165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WcxhwvKSc5b2IcYbnhyEyjHhKPPCadkTEbsGrKZDwhI=;
	b=vuawdEFzN6L9I91dzo4sN1xkAyaHvrjZCKyWCKQt6JLekc018BlbUKUCpLu2TjXgQkbLPM
	DVVWj8jIb8qER8fBbPa5jo3ye4tge/eSWLrt3O5y7pw+oBUARagJzQniNIYJzH0m5OBohE
	ju3+jQFghY0p5q45EOkuHlgjv0V9Xh7gfBDlTZuSsjyrR2rZA8kvC5EsdyC1PyiWSc5u38
	G1XjF8SqmAPYZqYPI9umXQmZHCNcRNvOLFgAMtW0hKD4NA2ZBHPVYh5m8Z0zOLzg0bIMgV
	NQJ8zCwwqrsi2d2YwL+1ahxHoTCyhCu3Y77yDU8zqxwN6O/MWauSL3lsm1ZBAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev
In-Reply-To: <20251027114032.390754-1-sakari.ailus@linux.intel.com>
References: <20251027114032.390754-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: gpmi: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-Id: <176166715957.365556.3971555889957567045.b4-ty@bootlin.com>
Date: Tue, 28 Oct 2025 16:59:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 27 Oct 2025 13:40:32 +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: gpmi: Remove redundant pm_runtime_mark_last_busy() calls
      commit: 8f9213aac51dfe1bb3139e6b1d2cb35690f670b6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

