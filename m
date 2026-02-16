Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C411A9F88
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231208; cv=none; b=Dw40O8HdkYtGbMI9QkyyuKt9j0r8B2rKN6m6jG2qauvq4tI96e2UH/U89NRVpvvph7xXkVAP3GDOZ5eI2+NqomS74DgrNg0wC841dlgQR8xQqWY7LAuQmbqVjKcdM3OgcEAt0eiFtmh7JMJDlZkGDbS19IF/+SytyyEJfN1urrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231208; c=relaxed/simple;
	bh=ltBVPeOt5z5WjOiMiEGSl1Ql4XC8MVcQkC545gvTXVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MNXGYph6So+yV9ORIMg5Ery1QSDdFoprhoM0z6/5DL4ixVilUA7oziuXKLg1T6U2zIIlAY9i3tZFTBjBGl+kmSC/QzIvej4CN2X4PawpULatfFGdbAlGmejSDgXuUOaouZ+LoJ2YwpoG3bf8K4PkKePZIeOirPlVAV++TjdTdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g560gdWG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g560gdWG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 45F654E40E59;
	Mon, 16 Feb 2026 08:33:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BD37606CF;
	Mon, 16 Feb 2026 08:33:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 508F61036908F;
	Mon, 16 Feb 2026 09:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771230784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ltBVPeOt5z5WjOiMiEGSl1Ql4XC8MVcQkC545gvTXVk=;
	b=g560gdWGk4NtlGEUXeJFKWHrZ1g2J52Y+CRGS/+n2lX1ipT3FoS49uOllNUJBvtfLxCvxN
	RTI4QWX03NAby1de74jQoE8TiLNlTlPOcjfzj41JyprO9UAtiyJZ2cyO6aT+9KyY7UKMNZ
	5eLR9jv3K91FZTGUZiV/RjERoDMGS3AJX3oLOySkJ5YDPApC1+PVuPS1R4pGZRD9nkzrRF
	TaaGc9WCyLqaj+hkLKJ8kcONKeaji02yJrHJunN3xt4yxm2VPMEvomx6cobqgfns9OpBAk
	Iwh0Z8sqoBkjP2Qc7X/Z4WA9CTj2Z6AJS3dbZSDH3hWhSgRUzc5qb2Rs3mynBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,  Frank Li <Frank.Li@nxp.com>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org,
  imx@lists.linux.dev
Subject: Re: [PATCH] i3c: master: svc: spelling corrections
In-Reply-To: <20260216061755.2801697-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Sun, 15 Feb 2026 22:17:55 -0800")
References: <20260216061755.2801697-1-rdunlap@infradead.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 16 Feb 2026 09:33:02 +0100
Message-ID: <87zf59ulz5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 15/02/2026 at 22:17:55 -08, Randy Dunlap <rdunlap@infradead.org> wrote:

> Correct spelling for 3 words as identified by codespell:
>
> svc-i3c-master.c:340: tigger ==> trigger
> svc-i3c-master.c:532: reamins ==> remains
> svc-i3c-master.c:734: filetered ==> filtered
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
