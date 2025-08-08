Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF313A3F7
	for <imx@lists.linux.dev>; Fri,  8 Aug 2025 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661448; cv=none; b=dyDYpnBL22qZGXJEtFW8dGzQhBED6ntWvMNg8G3PiogrHttLBcJ8C5axQZwBA+oXLXI6tNR+nhFmLCiWiezygvuYpJ8uyri4iPPdbKbmsbqHrkamNHKWThwDKd6SRlvoz3FhJOvbadWoNrFwhJYIk8hgR7R9B52fmjYqWqUhxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661448; c=relaxed/simple;
	bh=PajUKIG+d1rsxnTFzvD9VhNvGrQHU8UGNQhvUamGvNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJ/HBbGAVm8H997pGDDXCkZt6pexfiAeg21NX/3X3rKFkMH23vYXPag6hMn/FjZFhTAqEJFzZg/qvxlowixi8VO3Eah6J7wk0fwR/wkLsZzo6f5GZHKl+nrf35ai/7djYpjq+7oq2hMHvxTwx24CNcm8bf5YNdPMt9Z+eMJ1GcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com; spf=pass smtp.mailfrom=savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=PoXuwj3/; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="PoXuwj3/"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 013C03D84C9E;
	Fri,  8 Aug 2025 09:46:35 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id x_Dcxyc46QcK; Fri,  8 Aug 2025 09:46:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 342083D8510F;
	Fri,  8 Aug 2025 09:46:34 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 342083D8510F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1754660794; bh=SFTtCwYoU+oAHcmhDwphrupUVwagkfJgXHAqpkplwDY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=PoXuwj3//2SZ7hSSBL9AY2vpf8qXztJke6N9T5Elb+pEK0U/asopRCI7e7bXP1TsF
	 z00cOQSp+LfZLxvNFjzthSm/O7H8hE01Og1jX8v3mcuwxiBbFxFiobIaXA20Q726iU
	 /Q9wEbGivRbG6y2Pc2b1kU1EkrTZlvdf6zQaMvvMWs9CjMk2hH/PB8KjE4MA41WiGO
	 zxrmWaXtCPYYY5TeLTkcoiSJeOcYHuBn4ANdMpD27WUr/iG3i0jn74b+Q8/dROKyCf
	 9e52zuuz9Yvh0WeqBWKVw6pHCFqKOcdg4POzG/ZG5B95mryPJG48IQqYAJAy4jCSqd
	 tCeJl6DLm44Bg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5Xvk3l-accg2; Fri,  8 Aug 2025 09:46:34 -0400 (EDT)
Received: from fedora (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D2E9A3D84C9E;
	Fri,  8 Aug 2025 09:46:33 -0400 (EDT)
Date: Fri, 8 Aug 2025 09:46:32 -0400
From: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, Frank Li <Frank.li@nxp.com>,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Abel Vesa <abelvesa@linux.com>, Robin Gong <b38343@freescale.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 0/6] add support for pf1550 PMIC MFD-based drivers
Message-ID: <aJX_uOmSODmLfWkZ@fedora>
References: <20250716-pf1550-v9-0-502a647f04ef@savoirfairelinux.com>
 <znrv5235mga6ns4oue63o2acwmj5gge4c2mr32m7pui4lkamji@cu7zk4skmqkg>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <znrv5235mga6ns4oue63o2acwmj5gge4c2mr32m7pui4lkamji@cu7zk4skmqkg>

On Fri, Aug 08, 2025 at 10:12:09AM +0000, Sean Nyekjaer wrote:
> On Wed, Jul 16, 2025 at 11:11:43AM +0100, Samuel Kayode via B4 Relay wrote:
> > This series adds support for pf1550 PMIC. It provides the core driver and a
> > three sub-drivers for the regulator, power supply and input subsystems.
> > 
> > Patch 1 adds the DT binding document for the PMIC. Patches 2-5 adds the
> > pertinent drivers. Last patch adds a MAINTAINERS entry for the drivers.
> > 
> > The patches 3-5 depend on the core driver provided in patch 2.
> > 
> 
> Please add to the whole series :)
> 
> Tested-by: Sean Nyekjaer <sean@geanix.com>
>
Will do.

Thanks again for testing!

Thanks,
Sam
