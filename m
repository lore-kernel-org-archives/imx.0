Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5F36E495
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783286960; cv=none; b=aD2DMqXfEojkpNql1wKckA85vBWjW8w5wFdMOHHfH2DKYloJ6r2q9yW1QviopnVNdR7PXU03pbqPRnx2osvWvM/AVsa5BKc3slCGuJ4Ax6OtWlxTYoF289FYXSMI2jVF++xGbB3lbx/lGlpufj6WhwTOCBjJbq4uwHbBNDloyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783286960; c=relaxed/simple;
	bh=/r0eJMvvnAdleniNLWpYmr8q8GjoTuaeE/tFTB7jnBU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPNER1LoE8WmwZjHS1bgMERc1Fp57da/5SSbXrPEmV+prowHxlWZntVaCoBLhXCoDyWHZVpLgyNiNLN11jWX0PCtNinV/aSGnwnBlcEBSfWJ/WU6vXS/oCMfQAr0rgqziKYO0hCawpHpNPphhDjJr5noDSCZJc3JmGz01ykpkbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X8hiZRTa; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X8hiZRTa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 213E04E40C74;
	Sun,  5 Jul 2026 21:29:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAC67601A2;
	Sun,  5 Jul 2026 21:29:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1B4311BB9580;
	Sun,  5 Jul 2026 23:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783286957;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=+lEZYk68llCYxz5k33z4dXZCH+pqFVSGDQWFkklMakc=;
	b=X8hiZRTaimBTbj3SbIddaflS70kalPEWPlfgOBOlZKn9ZKa4jek79nEeRS5cokwZFALckH
	6DQN6IAvoYn9xcOicF+CU4FUW6EZOfPrrXQDX7XTdywX9ZMkrMGVPQuS/pba8Yd+9RBID3
	p/p34vibaREy+LTODRBXhMF82rnoZmDdzwIsrU0anvyqrnRg4vwuHODfG32ZDzWZMjOow+
	Z8G52wvn7MneMLtjscH4ZK39TG39Jw2oU4d+og5jSxxXwtNw160qcfseiv6uXOQ5NwhrCx
	7o9hyicmW3GwXwr8rNQDQsCDqI51Bkrvg7JxW8N/EnCae1NhxKmU5lTfCJCCnA==
Date: Sun, 5 Jul 2026 23:29:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
Message-ID: <178328692974.58266.14923284567218561047.b4-ty@b4>
References: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 23 Jun 2026 14:08:21 +0800, Pengpeng Hou wrote:
> svc_i3c_master_xfer() emits STOP or force-exit for the final transfer
> and then waits for the controller state to become idle, but ignores
> readl_poll_timeout(). The function can therefore return success while
> the controller is still not idle.
> 
> Return the idle-wait error through the existing warning/FIFO cleanup
> path so the caller observes the failed transfer without emitting a
> second STOP after the final STOP or force-exit has already been sent.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: report timeout waiting for STOP idle
      https://git.kernel.org/i3c/c/90ae03e37e26

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
