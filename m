Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EA309F03
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161539; cv=none; b=QVmaTev9YxyJ/s9AXZEjOCBrl84QjCuvR/Ud97yk/N42EnInHCyUCjL8Vwhxk6TEYnXVq3mK64XnkJcf2G1VgoVrOjn01V9KeOrIzc7lNPsAxmh5eFw8F06HT2w2tVsKkXV/hTSmnpDzbVuauWR1TdAY9gaeu8QJlR9REaw8O/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161539; c=relaxed/simple;
	bh=xK32v/0Jkwck6iAKn3UemLakhpvM4618EmLE+cDlDTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s/KSh0HJby+f7VV652mhZf7Yrlp017uojqtM8E4b/bK0AlAWufU+JlRWxtmoyZp/yaWo+XLxoXc0hwqlVibuz9+/PeGFR3NQKsdnSK6Bzwqa7zGn+fOqCuC19QyVA0/90EQoSCVSJ7X268MvJyeoaWbx5WqKtRXM0RWrEalGIXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=veGu8sJM; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="veGu8sJM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A19A0C0244A;
	Mon, 29 Sep 2025 15:58:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 500FB606AE;
	Mon, 29 Sep 2025 15:58:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B215102F1A13;
	Mon, 29 Sep 2025 17:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xK32v/0Jkwck6iAKn3UemLakhpvM4618EmLE+cDlDTo=;
	b=veGu8sJMgZnNLDBYOB8QxNyDYhYCEkdSxQmW+fqbx/4azPd+BqakxhSgcPIXkCr9NhWpXt
	ldSbI3IKsjWn2EqzPV4B6h480FMxNAug5jTHpVTRtoUZtBw8xKOt5XXSfmY2tfuGZTZHLO
	DGn2WAzuzXjNSXhGrhL688fP2Ge3fBG1V1tpGqTXYFd486GrkHfK6RvxffkYFcKVLBxONs
	D/vPqQ7Q+yQBkhDxusjfkGkbVjzhySpcBxSbzlp7HKLEUVvEx2m8N2jsbmS05MsoEAqCKM
	3hPEkPKX/E/k9R8qr4xLq6AMrJn9JaefrX5fk6Q5iyzTFuEsFEUVJ+U3pDCMrQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Han Xu <han.xu@nxp.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  stable@vger.kernel.org,
  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N
In-Reply-To: <87ecrpi741.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 29
	Sep 2025 17:57:50 +0200")
References: <20250922153938.743640-2-maarten@zanders.be>
	<87ecrpi741.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Sep 2025 17:58:53 +0200
Message-ID: <878qhxi72a.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 29/09/2025 at 17:57:50 +02, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> Hello,
>
> On 22/09/2025 at 17:39:38 +02, Maarten Zanders <maarten@zanders.be> wrote:
>
>> Commit f04ced6d545e ("mtd: nand: raw: gpmi: improve power management
>> handling") moved all clock handling into PM callbacks. With CONFIG_PM
>> disabled, those callbacks are missing, leaving the driver unusable.
>>
>> Add clock init/teardown for !CONFIG_PM builds to restore basic operation.
>> Keeping the driver working without requiring CONFIG_PM is preferred over
>> adding a Kconfig dependency.
>>
>> Fixes: f04ced6d545e ("mtd: nand: raw: gpmi: improve power management han=
dling")
>> Signed-off-by: Maarten Zanders <maarten@zanders.be>
>> Cc: stable@vger.kernel.org
>
> This patch does not apply on nand/next. Can you please rebase on
> v6.18-rc1 when it will be out? I'll take it in a fixes PR.

Nevermind, my fault, it's applying fine.

Thanks,
Miqu=C3=A8l
