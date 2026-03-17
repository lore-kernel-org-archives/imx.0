Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DB39DBC4
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737614; cv=none; b=WpYcVUUrD8A3PhP6JxznHMgsRncUU85ebAyGHi9+MLdPUPYXiDNaVECQCJc+QBIvrTz+MObxIAjgKH/jFuXlivmOIYbhXeiz0oMBRRqcmPa6yOhq8er+F/jpfbkFC9oKTMOPhu3Vp9GzAQ9QLH46UKaZkXMnnTKGvMo/rtLXRus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737614; c=relaxed/simple;
	bh=In8idt2yZweANMAepWHj54chzIEKvH54YasTehXIpzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SroLww91JfoeiVeEHrMHuQq4vRPil9thqeC7+qs7nQxP7IW/rem87y4lIjMZgmJtLV1bAi6lGmilN/87J9ncHDM7zXruCKtfhWpURuGqQl5cRqZnCkccnKk41mAN9ovohQd1E+cRzQo+ZlOQSPH3QRjxVitPUyBDNzjnHUoTtUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VfXCGi8q; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VfXCGi8q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A6BE51A1107
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:53:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DADA5FC9A;
	Tue, 17 Mar 2026 08:53:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D105610450425;
	Tue, 17 Mar 2026 09:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773737604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=In8idt2yZweANMAepWHj54chzIEKvH54YasTehXIpzQ=;
	b=VfXCGi8qmU3nCq3Gukypcit5ZVFlruwkaPJ15ozYvVPvdTISE6bbCPJBV9jYPT9MUjP/g2
	NUQw2F7PQ1VHJEeBeLSJaRZvTb62wcUycIwRGHhWCrXsdN61z5nI5LetmpU5aUb0Wo0dxX
	yDMxSeNXLoMZiJ828qRnMEVnLwNakdBBaYmYdQzcMwE1s4gkBOjxrMS0IHSDmCgFIbfBMf
	nSeZWeoiRuUhfE2FZY7oGMDN8EXTzpu5+t7wpyjkFgsMrymINVwrLNy/sXHNIgtBAC6Vj+
	9QIa0urILQ6XsECAr85kUH3sqqXGKAGsdGW16cZzmHzuP+zpkhZdL2T0EinQoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Frank Li
 <Frank.Li@nxp.com>,  linux-i3c@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix missing newline in dev_err messages
In-Reply-To: <20260317034015.638-1-hechushiguitu666@gmail.com> (Haoyu Lu's
	message of "Tue, 17 Mar 2026 11:40:15 +0800")
References: <20260317034015.638-1-hechushiguitu666@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 09:53:23 +0100
Message-ID: <87a4w6g7lo.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 17/03/2026 at 11:40:15 +08, Haoyu Lu <hechushiguitu666@gmail.com> wrote:

> From: "haoyu.lu" <hechushiguitu666@gmail.com>
>
> Add missing newline to dev_err messages in:
> - drivers/i3c/master.c
> - drivers/i3c/master/svc-i3c-master.c
>
> Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
