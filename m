Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93E5F876
	for <imx@lists.linux.dev>; Sat, 22 Jun 2024 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719095631; cv=none; b=itcoOieivoK5vNAVVBFq4Jq5cjWbQUuONzDkKiiPup3svD8Fe/tzHXsVzsQlC3xz302zT0fPPux5dg3GgSuWIQOgq5wSe8XlBdI0hsYj4aD/mBUyvOm8I6+WvyF9EBGDrWsQ+nhwdqHj3N0IPi7PSrNAPdI9u85R5EwcmLHO9o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719095631; c=relaxed/simple;
	bh=QFHlACcGn7OqUVZY8YEAHPlNKeeUxY0F5pOJFUjj+S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSUUo1aP8dbonwreBeNB0Wz0mI4hwTVM6D/3EBkEmiaSXI4ci5rv//EhTONC/f64tF6ipr+zM6m2kf0owJ7pcPbJmgj3gUtK4hMwzdfXJKLX9vQODsu2N12q78E1fyN7Hg2vJI2ciCGtXh1vFv9zDNvxg9GUttCi1cbR2mVUk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EyC1qKLs; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EyC1qKLs"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5A2BFF805;
	Sat, 22 Jun 2024 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Np0HAdoh8EZv8Bq/6GLeT6pSPf91A6nHL3cv9CEp+04=;
	b=EyC1qKLsRooRDsCc7cZWjDHJk5YCZHERbx2gBaEtJXyPYnxuQ+kvG1QzOo+N0gy6KFn9m/
	9dTHPEI2CzmGmcq/YyoipSD6y0LXNVOSPsJqJgmzVezwuhT9FCOAyvziA7iAGHuYWPj4Ja
	oryyWD//xLa0KNnGo97fvstUrLYdXctiq1dUQoMod7BhrDmAgJ+WXfLu69dqZaA1xeoXaH
	Dj84+I/fc/Yh3C3uTFPITu5uuqPdNlK2QhktCuZM+3ztbg5U5Ly/RqP7fiXdXDVxiW2em1
	kbm6OBIGkNRvj3WGMDenA1E6u3rZpXSLj74QDZqt+8bPaqQaJcAPjBJzQq924w==
Date: Sun, 23 Jun 2024 00:33:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 2/2] i3c: master: svc: resend target address
 when get NACK
Message-ID: <171909557749.2164405.8135288010118106502.b4-ty@bootlin.com>
References: <20240603151527.52235-1-Frank.Li@nxp.com>
 <20240603151527.52235-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603151527.52235-2-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 03 Jun 2024 11:15:27 -0400, Frank Li wrote:
> According to I3C Spec 1.1.1, 11-Jun-2021, section: 5.1.2.2.3:
> 
> If the Controller chooses to start an I3C Message with an I3C Dynamic
> Address, then special provisions shall be made because that same I3C Target
> may be initiating an IBI or a Controller Role Request. So, one of three
> things may happen: (skip 1, 2)
> 
> [...]

Applied, thanks!

[2/2] i3c: master: svc: resend target address when get NACK
      https://git.kernel.org/abelloni/c/2d15862dfba6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
