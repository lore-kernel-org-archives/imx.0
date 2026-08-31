Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A873911CA;
	Mon, 31 Aug 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202584; cv=none; b=JklOVSQFgZ/CgjvCk3j7a8eJZDtc2KMWpniQcmseU1H32W3O7PRthcLoH6gHY5reSH34BxBhWCMKfn7FFxYrMFWR6fwOrIlmfPlnjuH04xFyvgNl4SFGylN73Ia8c68Hmc4M7o3Sfkq+vs/LqrhBbpE8IvBbj8y++Xa+LPDQxEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202584; c=relaxed/simple;
	bh=IXUWLJgzgD14L7SZeQEsQut4pZ6fNv8iDmHk85TSBc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=knveHqzcUQBUaVRCc7WH7mw+9llQtYP2oKSu/Pcp+viL1j1FCWBVVobpL9hMAcJJ6wbx7wEa48oB9a9BWUkRaCqHzKNjnxBHFMw44PtGfmUwq5AONNHNHwi6UZRdY7zvYQTBsmSL670rakLWmtyNygZ7oNnoBldnesSymlhwDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM+WxA6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM+WxA6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41C81F000E9;
	Mon, 31 Aug 2026 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788202583;
	bh=TL9XKFaN/9ZAt1VeE4B8OnpJIYKqD1Kx4lx3FwfHgtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LM+WxA6GpcPf+nTPSoxebPbYTkDn2quZJOw0UWLB1TNxGV8pBMnvnPNcDi2SdhBuL
	 mZNtzSMBD7jDyG0NL6DLIf7caWHBKnwyJyOguwAW3H6bHTVrNW5I04vmqgxODRMv3G
	 o33Ct+gYsVZZcj+xtzkmE+M65+iuT9s2cF27oW5kyj/MbXnoDfCWWfEBBKTTd7qnTX
	 JoH2e39HXhP+OhZ1pQMhl0zt7lQX98s4W3bunXKMV9+5I2ZgqNRURN/5TYUDi8pV+r
	 f4/LUr7Slkwa/f1FcfjBLgZS1ulSaJQ589jUQeISAvGj5a+2CD3QWPnCGyYnxcORmD
	 FyMSwhfIjiJCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] media: dt-bindings: convert ovti,ov2659.txt to
 yaml format
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: media-ci@linuxtv.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831161121.4048134-1-Frank.Li@oss.nxp.com>
References: <20260831161121.4048134-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:56:22 +0000
Message-Id: <20260831185622.C41C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Dangling reference in MAINTAINERS file due to renamed binding.
--

commit 86f22844bc16fc2237e1a2e032a70e273a8be8f0
Author: Frank Li <Frank.Li@nxp.com>

media: dt-bindings: convert ovti,ov2659.txt to yaml format
   =20
Convert the OmniVision OV2659 camera sensor binding from plain text to
YAML schema format.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> deleted file mode 100644
> index 92989a619f292..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +++ /dev/null

[Severity: Low]
Does this file deletion need to be accompanied by an update to the MAINTAIN=
ERS
file? The OV2659 OMNIVISION SENSOR DRIVER section currently references this
deleted .txt file, which will result in tools like get_maintainer.pl parsin=
g a
dangling reference and potentially missing routing updates for the new YAML
file:

MAINTAINERS:
OV2659 OMNIVISION SENSOR DRIVER
...
F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831161121.4048=
134-1-Frank.Li@oss.nxp.com?part=3D1
