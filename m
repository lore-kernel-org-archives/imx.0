Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC61379C40;
	Fri,  3 Jul 2026 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068951; cv=none; b=iwE0EKHePloGPDrHpGJX/oThchaEWcTWhBSP37CIh5K8zr01IDrK3dNfy+vqa2WanasOTc0dICjAAH2HcWxlZyIzzxilMEjD0sWbplXy7Es+6kbXdRUEpAU0sQSHoV6XbOh0M0jnRgBsmGATXaNQQEeRGC8LTM7hc8dPTXRsbCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068951; c=relaxed/simple;
	bh=Eocl64L1wuy8xakOj3o5tS8XwWokxM79/at9+oc5X1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mJT1vl9BDys+fNGgcglTOnTuiLGPCynILSigih9rmdK/6VOwDEKXfmzJBNymKKKTCj1viv72ViKyjO3SX7QiQBnQBLHGrV33yHh0ZL4v52kz0yTZFcczhWGL1b0BCx7ZANGEYYYfJLdp0d9jo3UyML+t0qcRx8Gl4dc20VqcdSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq9BKctp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq9BKctp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFF41F00A3A;
	Fri,  3 Jul 2026 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783068947;
	bh=Eocl64L1wuy8xakOj3o5tS8XwWokxM79/at9+oc5X1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wq9BKctp9pQsMZ1RnxaEoHIf/yXdwhxt+dLZrcGsTgSMB2voUqVg3DniR6Er0bZdB
	 Uqi+imGbk4pYVh5pRh35mzR6O/vNq3je8AIhBSZ7YwtsbONM+EenDh9o7ynsom1QQD
	 v/NBv3vZrmjsgJ+n9eTU9kmK6qksfuTviQ7AE6LArE2fUgmFCPZc58nLDCLTcyJZTD
	 4bbqRDtMgnAjAm9oEWxXbLjBgqj1ApeGREGB8LkgqrtoKdTqYagvbloWKlrfnSDJc+
	 Q3KAVCNwg2HVs3ZtycajsDoDjj176yZkexZ2ipRDp8fRN/4U/1mPD0V881jn6NbVON
	 LraeYNVBXeL/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <126ae03f37ba587560ab8c94b7833236d97990de.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
 <126ae03f37ba587560ab8c94b7833236d97990de.1783067947.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 08:55:46 +0000
Message-Id: <20260703085546.EBFF41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to add 'I3C' recovery GPIO properties,=
 but the patch actually adds standard I2C recovery properties to an I2C bus.
--

commit 460d6d4855137d91e75cf4e76f05f397a7d5bb75
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec

This commit adds support for the WM8904 audio codec to the VAR-SOM-MX8MN bo=
ard.
It enables the I2C device, the SAI peripheral, and exposes the sound node v=
ia
a simple-audio-card configuration. Additionally, it configures the I2C bus
recovery pins.

> Add I3C recovery gpio properties.

[Severity: Medium]
This isn't a bug in the code, but there appears to be a typo in the commit
message. The patch adds standard I2C recovery properties to the i2c3 node
rather than anything related to I3C. Could this be corrected to say "I2C3"
or "I2C" instead of "I3C"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783067947.gi=
t.stefano.r@variscite.com?part=3D5
