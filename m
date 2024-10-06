Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC9E18A956
	for <imx@lists.linux.dev>; Sun,  6 Oct 2024 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728244336; cv=none; b=HHDI/TzSzE0Mzi8w7axhwjglPpNc1xG3y5FUKg1juBuGUL1eOANfrcp57oEjUT/lMCJJ7wYMcH42gPSOEPzRLGe4hLHRfUR0/0wPtn7lbBDYMqm0XQDmyfZ2x+FiHd+1p2uiml213JHCbSteWsL7va4Ixdy9EVLErXhEh2VVVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728244336; c=relaxed/simple;
	bh=hcAby3Io/zPr5XrSCasVph37xtIpwQn3zw9+yPB0qCo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VZWVDa2oIRXvvOBTRGA1CffQEoEvAXeY+f/U4cSf5h+FO866ZK12BkvomzsgODWCfsL8O68gbsql4LK9B+Cv1Q78+tpKcEj+Q71SDs7smLsBEuhagqq9OROEkg+iCiEQ3nluu1SWvA7Kkz7xjHIXKnLnOuyXhbGzmBaQuUxxQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vZySwmch; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l+7m6Tyj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vZySwmch";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l+7m6Tyj"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728244333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i+CH/NL8Fvz99AuAgH4S4R3ekZKC0ly626NUwbjewAk=;
	b=vZySwmchYdifwH+eRGy640PtvwPH5j9VI2He4SGHVCL6MGBLXhW/MXURyLTvdTm246XyuO
	f9ud5fT9o9z6cE7MXEpGbrwuWGCcscApdGDuKg0SWr5ENHmjbqWT96wVGlLdEXtUY5cjlB
	Gt/bHknM+Jmd8e/ynU+htW82wpmlvaEJ6abdTxuGODr5DkjFDxra1EbHPHMCgbC8/nVJW5
	vrrLbw0qgEE37QYKtzRKJlpq1SzVGxDszZCCMHZd0pM32LpEa9Gzbhg5rziWiWALqmB1sC
	LzYB1yBv/2dP4+htxx4KIO1HMGYaEjJzfBVq3vujx6MixXVkBzSTUUOY+O1msQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728244333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i+CH/NL8Fvz99AuAgH4S4R3ekZKC0ly626NUwbjewAk=;
	b=l+7m6TyjfVDcWGDs3HWiinPlHXUMCXjlmDtaZAfKQY/ynRxdR32zxGCioQgzUa1pVkOT2u
	50HkzodzIPLRccAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 23/51] irqchip/imx-irqsteer: Switch to
 __pm_runtime_put_autosuspend()
In-Reply-To: <20241004094123.113742-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094123.113742-1-sakari.ailus@linux.intel.com>
Date: Sun, 06 Oct 2024 21:52:13 +0200
Message-ID: <87h69puhzm.ffs@tglx>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 04 2024 at 12:41, Sakari Ailus wrote:

> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to

git grep 'This patch' Documentation/process

> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().

Thanks,

        tglx
