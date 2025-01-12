Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD261B4135
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 23:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736723093; cv=none; b=L3XJF5GybRz6+91/cUwf2Y3igAcZDSna7n6G460ZV7kL6Vkrkh+pN7RrK+yF2KIgahjyZ5hYIIMRP46jU9WPVmW0Mk79BXN+DYVS2K9ELQLhhYu21jsVgiD0t0FRP8krzdW5hZGqX6vH+w9tLRYM+8/r80R899wd76cpt9sVz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736723093; c=relaxed/simple;
	bh=dfDnp7zDnMTLpjNC6jT7sHa+51DURALsalSDNv98e+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unH5PsGhUkrJ6r2nPt47YGgq0carIKKmdhyo69EVDA/XBOQbAhGYz6ffZkclAbRKXnCtb6ZF03QI5M3jHNLYcJOjc+WnJjwaNFTsDQydOnXK7OHK3SgvEX26j7ejitkBhQ4vtrgNOK/yDnh5LSnE/m9eFKXYQTRiyW3FUSOA7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d6KOfBwK; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d6KOfBwK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1443FF803;
	Sun, 12 Jan 2025 23:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ClLztbhudflHf1BTGMND+rv21TzPzRc7fxZhF/wvn6o=;
	b=d6KOfBwKki0Y6ZbYU3kvIMs4NPEVAfxe+RXwkmEtQA1fsleVOWaUGNXuPJP78lz+eSuGuT
	6NeD2kV8fDp33LgMYQUSCe+f4eovDXlMxY3Rdwcc9GLdrVNjS+QS1f17j7h8vCGCiHOhPm
	cl8UstQ+L4QWuRtT4dCoqOXUnLlMQXCnKWKp1DZia1zk3+fsqGNxIWKQb/JDpKCiXj0K1Z
	bsabS4AEUiBkgWJ5LVICAOfGdduDK1wgOHgDypQovWIb+EE4l1omgwvwIOOcEUPruQm7EB
	tX/DE+v3q5k0xw92rD0+nX0pd+XqCYjqHCqh9PBIvXYu9cpS/xeLkuUzHITpZg==
Date: Mon, 13 Jan 2025 00:04:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
Message-ID: <173672283107.1485431.13798572959032864238.b4-ty@bootlin.com>
References: <20250108225533.915334-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 08 Jan 2025 17:55:33 -0500, Frank Li wrote:
> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
> 
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Fix missing 'ret' assignment in set_speed()
      https://git.kernel.org/abelloni/c/b266e0d4dac0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
