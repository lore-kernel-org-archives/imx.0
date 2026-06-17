Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2373859FA;
	Wed, 17 Jun 2026 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729514; cv=none; b=XZ162lo5PYI4mGosiLLp2PDbvqVPf/mKImXOR6PxsF5g58XBVZkY1wyDTua4pDDXSgHRfZqGs7cBFGZjinCzl84y26c4GcY3Vjc20jzS1oUMWH5f9S+tph4/SnOY/TYuqkcDTLwXWTQEpFXuwv/2ggtu6p/1Tpw132NMMAkMerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729514; c=relaxed/simple;
	bh=pLoCMZ+y6XqMP1GzjkN/gCx34dNEYzEhy2gulrgnNeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TPG6EZNi0bY0sm//5fjZyA2QU3yBaPvPWDJR380MeB4wOeV1nRXfFQ3GZLp0hBHcWtUgEUbxeeAQLT+cR5v2Zgvr30NSHz5aDV/Ya0wKZJoBjm1+Xi8g7XKDywwtTSytg8ZWWs2JU1NY8WS0S7Rv82dcaMUIObPjOAbG1q+M66o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZjk3HNP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZjk3HNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F23A1F000E9;
	Wed, 17 Jun 2026 20:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781729512;
	bh=pLoCMZ+y6XqMP1GzjkN/gCx34dNEYzEhy2gulrgnNeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZjk3HNPAnIXYNW4tXy0UGohEERe4xQFPIkHVj88P48yLhlo8R5G3YPHPiAWq0Ii4
	 bk0vzflNk5YqO+eV3hoBl6iLnSAZoOVCiJ6l7GkX/cZ4oIkGYOOHmpyhDA6g4zwsgZ
	 9x1bL9J4WtRIlpYRyVdJ/jNFxw3Y1Gdda+5mi0K6mfzQlAK6WQgaIPUM4FWM5N088L
	 EH15ElOIRa/FzCh5Z4B5c5fCfxnDciYBtsnjZsRcgum25aMt8stRkOCD5mbuX5H8gM
	 T6jC5lSjECXI29iqAetP/5TjVT+R7dWooFQOwewY1iRc2k3wwGYE3rgcTPPcstkbsx
	 rA8DpmfB1ublQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] media: v4l2-fwnode: Extract common helper
 __v4l2_async_register_subdev_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-1-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-1-7fa6c8e7fba7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 20:51:51 +0000
Message-Id: <20260617205152.3F23A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly states the function from which th=
e common helper is extracted.
--

commit 1d02bf2bbb834a499240f695cd83dc1f1f8db5fb
Author: Frank Li <Frank.Li@nxp.com>

media: v4l2-fwnode: Extract common helper __v4l2_async_register_subdev_fwno=
de()

This commit refactors the subdev registration logic to extract a common
helper, __v4l2_async_register_subdev_fwnode(). It allows the notifier
parsing function to be passed as a parameter so that different fwnode
parsing implementations can reuse the same registration code.

> Extract __v4l2_async_register_subdev_fwnode() from
> __media_async_register_subdev_1to1() and make the notifier parsing
> function a parameter.

[Severity: Medium]
Is this function name correct? The commit message states the helper is
extracted from __media_async_register_subdev_1to1(), but the diff shows
the logic is actually being extracted from
__v4l2_async_register_subdev_sensor().=20

Should the commit message be updated to match the actual function being
modified in the code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-imx8qxp_pc=
am-v5-0-7fa6c8e7fba7@nxp.com?part=3D1
