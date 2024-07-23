Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD541494CD
	for <imx@lists.linux.dev>; Tue, 23 Jul 2024 23:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721778679; cv=none; b=XkBmQLAMRHLDxKD5LBnfYI8EqDJMzqAv1Si/PKOZ9NGqDvnP7BaZU6YvsbH+hvHrRHOSIGyNqEQfSOkBXw6mqv7WggHfpCVcb7ARFYeOH08sZVcJIixTjdgJ8YbKQm5FM7sG4EXL5LpWpDsKy+NQTIT9fE/iFdcY/cwkBzdFeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721778679; c=relaxed/simple;
	bh=Wm5UoIr/OEWSQDZrBp+0/uQLHVeb0HROI6tDskMIEJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxfBoIZM6lSCnejf0ElQtFfYzeDXhmC5ezyssdkxDqz0TaYRklMvZ4teZ+f3QyHq80bRMVE4saFs0XHiXSPOvq8KAPf8Sh3aZzxAcioznJ8GIVqplHlHBeb5r+PcgdWKqtOPqvBf2NuijmkMjVkrpyMDA8bhqEUAJmeu8fZhSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DRflxrL8; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DRflxrL8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1EE0E0002;
	Tue, 23 Jul 2024 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721778669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+SKAQmjNRPaji+Q2BhvyaBaM+HsQEPmFK6Rpkla9Fg=;
	b=DRflxrL8MpVMUI+uncAzrlRx98puYtmSGXghvzQCd/+DZgH/bsKS8yRFALNOCojPtD4oDo
	5/hF9fHZOKaiiEskupQZsBbn9Y8gFeu4adMmsrCzp4rhPDQbtKOmZTMu0FzV4oevLkXX29
	/tZZ6HD3oshkLBTCq5UFv1uXLxg8veoFQ7SiAzOWssmex1/YwER/Motfc2RfRSFMqn/0/s
	SISdwrIyk2gc8rTQVRgxqTxk1yVal2EVLdrhhMx5jmKS0uHoDL6K4VR8ahQeH5apsGdpV9
	Tz0ASG0b62bTdsfSoATrToj8E3iJlI6tsuBdbaJyaH4owYgAK7gp5jq9SbboIA==
Date: Wed, 24 Jul 2024 01:51:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzk@kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
	krzk+dt@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	robh@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: i3c: add header for generic I3C flags
Message-ID: <172177859264.478132.7118416055894101559.b4-ty@bootlin.com>
References: <20240715225351.3237284-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715225351.3237284-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 15 Jul 2024 18:53:51 -0400, Frank Li wrote:
> Add header file for generic I3C flags to avoid hard code in dts file.
> 
> 

Applied, thanks!

[1/1] dt-bindings: i3c: add header for generic I3C flags
      https://git.kernel.org/abelloni/c/3564d9eb607d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
