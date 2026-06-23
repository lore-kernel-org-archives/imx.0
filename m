Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC2B3D47A1
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206195; cv=none; b=UEuvVP7Tq8+67GSI5dIPHYoWXH59Ur7Vj10R/5PMYoV03aeFuq+Iu+iheSAIeW56tnRQgzdFC+UBb1H4RaD9Gzjm0DbDCPXQa0dyPZpVXXdmk7lhOxtK/TfUHnUpxFUj01/ZB9uFC1P62Kx0rkEpuXDiv2kaZ7WSfq2F7yJR6Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206195; c=relaxed/simple;
	bh=/fuHLfgTRA4ElpvtJMg1gvFvPPNyP7cJEy8DoAfVjf0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=suXBa6cmggdVzCbAc7KRVNR4lEQmnbZbemSfzBqv9WysL3a90jXmG68UeNw79qSmrtvydaczZNABcjOpkieTUgZbCaNK6rLPpdrQHIyBjZqoC7uVV8PSgSr9BJiCcKyyA9bpegsdMw1OGXJf3tA01jbEZ54uatb+S0pK5dS0IYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l8cMU71q; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l8cMU71q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F04CEC6B389;
	Tue, 23 Jun 2026 09:16:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F664601C2;
	Tue, 23 Jun 2026 09:16:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B94E106C81A8;
	Tue, 23 Jun 2026 11:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782206184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/fuHLfgTRA4ElpvtJMg1gvFvPPNyP7cJEy8DoAfVjf0=;
	b=l8cMU71qR7xp1LF+qQdE7TdQPwMbDW5Maxu/t8dQBV//ZxabDesByvm8melI6wrrzQBoB/
	gadZvGuKWK/Xd/VvdpGjesq1sQJ0oU7LyS55ijWzZghcqvAqZvpmyWacVN8VmGHtct4JZk
	Khs5kut4O4XxqNchwzzM49uxIb1bvHE+Jho5kFAHrupRFdlwJ8MhQfgV+Dtn9TC5w2NZ2s
	oqAv5EC36yd1daegn6DmEyoNwRWQr1oT9nkdHySAQxZX3w3/2mnupTMwRXF0UboMRC9ZA7
	bnxGZA7teTi0W3XF+ds6FW86toTOzaUQDSTnO+NKD51guuTSdUUXEkap03i1ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Frank Li <Frank.Li@nxp.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org,
  imx@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: report timeout waiting for STOP idle
In-Reply-To: <20260623060821.23238-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Tue, 23 Jun 2026 14:08:21 +0800")
References: <20260623060821.23238-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 23 Jun 2026 11:16:22 +0200
Message-ID: <87y0g5mxax.fsf@bootlin.com>
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

On 23/06/2026 at 14:08:21 +08, Pengpeng Hou <pengpeng@iscas.ac.cn> wrote:

> svc_i3c_master_xfer() emits STOP or force-exit for the final transfer
> and then waits for the controller state to become idle, but ignores
> readl_poll_timeout(). The function can therefore return success while
> the controller is still not idle.
>
> Return the idle-wait error through the existing warning/FIFO cleanup
> path so the caller observes the failed transfer without emitting a
> second STOP after the final STOP or force-exit has already been sent.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
