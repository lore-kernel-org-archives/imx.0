Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD133E353
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 23:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761867827; cv=none; b=hNeuP6odAww/GARitJndlm+Si/L9Pav48+2JFZNbJAb0sj9DLaDOb9L86773SoyDwaITtATTP/lXl7m3IDQD+lbFRvAdCiQu0otNVYQ2S5jOHEicwHyyqT0uMEDzoavsmlTomecMA7mzvM2DLLoRCXSVxEm2tChzGRsQgK+UVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761867827; c=relaxed/simple;
	bh=PtQD0u6r75GGhXvET9DPoCf5+VY/3uU14M594x/zFFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Asq5plxyqvvzNlBWJngCgWiLWV+N30aRXmmaOGK/5r+bPjOvXtqhzAjOz/iDOCMIVrObnQKhAJ/qlgeKFucdGFZiBXC6DmKvlCd1/ZEWdCdeftClH5u71YWMwqIRjTQtSOvBOJ8Gvg4skYTELJoJUOgHrwXNtG6QYVb0u6Nxj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ITROjdTe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ITROjdTe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40F47C0BEBE;
	Thu, 30 Oct 2025 23:43:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EADA60331;
	Thu, 30 Oct 2025 23:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D03E1180CD93;
	Fri, 31 Oct 2025 00:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761867820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=7xAYHK3it1+6qqe3o8nqRfZAVs8VSB3PxQiuuoM7amY=;
	b=ITROjdTedUGq3gJUgqHH6S0De7ydtsZ4r1VhlIH2qPzMWkz+vHFO/TkJ1hgie+Y3k4uvJr
	egoxyNdfMqIJMS45n19uCAmp6HYhx1UfvwwDw7nZYv0EqyBN/WNFZ3cylATjTr61Ck5Eq1
	sS6ADz5V3dSAMa0LHiC9Wm2MIOgYgtW4erM0xIWJ2ngsCPoiLtJcY0pzSBVR9lFVjNQkIL
	rCTIl1nr+DGa2Ex5fbTIsGL45Xq9IxrsnljtPWTD5qEQvqSgrjdn9Wa9oZIFga4Ocm5DYz
	q82r9jeZSKEth6Anxh4Y1hcIG2rB/T+3RveGCpyXLiQmuHYNSTpgTFECo8H3yg==
Date: Fri, 31 Oct 2025 00:43:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] i3c: fix refcount inconsistency in
 i3c_master_register
Message-ID: <176186765078.475593.5246237578344242065.b4-ty@bootlin.com>
References: <20251016143814.2551256-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016143814.2551256-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 16 Oct 2025 10:38:13 -0400, Frank Li wrote:
> In `i3c_master_register`, a possible refcount inconsistency has been
> identified, causing possible resource leak.
> 
> Function `of_node_get` increases the refcount of `parent->of_node`. If
> function `i3c_bus_init` fails, the function returns immediately without
> a corresponding decrease, resulting in an inconsistent refcounter.
> 
> [...]

Applied, thanks!

[1/1] i3c: fix refcount inconsistency in i3c_master_register
      https://git.kernel.org/abelloni/c/9d4f219807d5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
