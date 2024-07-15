Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC313CA93
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721080101; cv=none; b=dsCe4TQ3Yjg5M+lP7mB+VnpgP44mAEd8j1JcYm6iikQ1CQs2qV3RX3351bb9cwQu2fP2KKBKdsgCMrW/uMLnpI5LLClAhPrulm86O77QaYRHhLY2HIpdw1tpeJVAQzIlcUQfOYxgX2BJlSGXCdpQIvud2RpcTqUPoAzPz5qLf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721080101; c=relaxed/simple;
	bh=ZBqo+HULYwwER+14CNXRyKt/Uy8m25IsZJT6gIRcM+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqD9rSMfqtZBlpGpht0PfObIcFG+FhTpkdfwxQ+hwlvtFoxNB6w3sdicJyAV4aLyELl1rl5R/oWVq/GMAxhyiax1/3/OkidzjC4avLX1+LKpgDpJTMM+X/5jfvUbDzeARyM+5RymcKpe1ck1BGINAJf8VfFuLCtvZrVArDPaswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NyFwTbqc; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NyFwTbqc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7F3A40004;
	Mon, 15 Jul 2024 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721080091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bu60QzsM2TFLIWO0vGxknFJil2R7GrMrQFYycAY9a7c=;
	b=NyFwTbqcN2AQwDW+pQuN6pl2iS4y+CbLCREiPmgvmKuLv7V+XiCXzbJH8Z3ZNYu56A5TCu
	BkqzuSrZ2te5r74lr//ZqjLVwyo1Pd251RfYp5D209qSft6a94ZoFtKU+md+Y/bVkKNUUT
	ShKVpWrqPMDZEK6+4CgKxvtEr/W+Vf8rtZIChUJLXxr9VbAqPNRNIKRdAplQnPzccqf1kk
	ViQLLKqVMUoML2JJYY7WklI6nfKMfe+r887JN7du8YY8guCODe6FOfwooMkEq46zAgRwmT
	rGJbxmL/7axGrhIQUupsZKJLWU4wmPFsoE4C40zcbPq4j4QS1905IgYfsK308A==
Date: Mon, 15 Jul 2024 23:48:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Improve DAA STOP handle code logic
Message-ID: <172108005328.1453338.6420836318188767994.b4-ty@bootlin.com>
References: <20240702223107.403057-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702223107.403057-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 02 Jul 2024 18:31:07 -0400, Frank Li wrote:
> The REQUEST_PROC_DAA command behaves differently from other commands.
> Sometimes the hardware can auto emit STOP, but in other conditions, it
> cannot.
> 
> Improves the code logic to better handle these situations.
> 
> Hardware can auto emit STOP only when the following conditions are met:
> - The previous I3C device correctly returns a PID and ACKs an I3C address.
> - A NACK is received when emitting 7E to try to get the next I3C device's
> PID.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Improve DAA STOP handle code logic
      https://git.kernel.org/abelloni/c/a7809cb368b9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
