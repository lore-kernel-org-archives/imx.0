Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7123E49C9;
	Wed,  5 Aug 2026 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916737; cv=none; b=e5hUa//UqUsXfQoglRRrop66pAS3c72fWYrUuP8y1TcgUWJESJIEwbwE/pB1ji/8BttjmqCEKTCU1oyz3rFjn6AtmndFGd3f2NjURLEu4WtYxepfDo/9E5nn6FsODdw5iV6SNeCBe84Pg16zw/pRIZ+BZktFdVHdzzDqEJ16aNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916737; c=relaxed/simple;
	bh=CSLjZfgCdfEyNZYxrRkcrouFiMtP/UlGfeTuwWMjmt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lOWKpze5FFsz+YpCrTkowk6/4c88sI/y6pagm4seebdynZd/C9QY+/JvXam2vkHq+Tpgwj/sJZ19QVzN0sjZ+Lt/+24Tbyac0rIMMBqnsFEd8DctrIlTMuiJeJ2Vb5NExQ2jLAG9xJwrEpP9AnnZJf/to8W/I+kO1dHntX9e1qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bch53RX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bch53RX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750AD1F00A3A;
	Wed,  5 Aug 2026 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785916733;
	bh=TbA4lBICKhj2VeQ3ypm4A6SfBjDZJZDnJ067z4CaMm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bch53RX6do/6rgo2/GPENCBBntsL5T77BwduWSEugr/LyI3jcwJHr0D6aezWuoAvM
	 rc24v1QT49SVj1vah+PNm5wDwgqto8MN+4NuYJMwQtjQ8LT+uMCe2pmDqXW5yC+F72
	 RErFc9olU8BoMrySD+EjxzdwGRLIpUXjDVPSNx0S3OaDIUeaiRqooYlPLoVYb4VENe
	 qKKGVCAdjf1yMGax95I0P/T510j/M4DO3oTL07KPz/kEE+x9rTrlbfeDcNSb7zV2Mn
	 wxO42C2Pmksen2AIZyAXsIa/chGfhKjhVI7spoXpWnEz6DKDAI918HL3QWGmiXTYZx
	 znLQu8EPZi+2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-imx-se-if-v33-1-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
 <20260805-imx-se-if-v33-1-212e32ff0295@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:58:53 +0000
Message-Id: <20260805075853.750AD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The documentation includes a kernel-doc directive referencing a sou=
rce file (`drivers/firmware/imx/se_ctrl.c`) that does not exist in the repo=
sitory.
--

--- Patch [1]: [PATCH v33 1/7] Documentation/firmware: add imx/se to other_=
interfaces ---
commit 1eeded898bb09b76f97d9af8af8f731e994e4034
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Documentation/firmware: add imx/se to other_interfaces

This commit documents the i.MX SoC Service layer and C_DEV driver for hardw=
are
secure enclaves. It outlines the architecture of messaging units (MU) dedic=
ated
to specific enclaves, and explains the character device and service layer
interfaces.

> diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Doc=
umentation/driver-api/firmware/other_interfaces.rst
> index 06ac89adaafba..6c6fa9a0ba1df 100644
> --- a/Documentation/driver-api/firmware/other_interfaces.rst
> +++ b/Documentation/driver-api/firmware/other_interfaces.rst
[ ... ]
> +
> +When a user sends a command to the firmware, it registers its device_ctx
> +as waiter of a response from firmware.
> +
> +Enclave's Firmware owns the storage management over a Linux filesystem.
> +For this c_dev provisions a dedicated slave device called "receiver".
> +
> +.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
> +   :export:

[Severity: Low]
Does drivers/firmware/imx/se_ctrl.c exist in the tree at this point?=20
It looks like running make htmldocs will emit a build warning or error beca=
use=20
it cannot find this file to extract documentation from. Was this source fil=
e=20
omitted from the patch series, or perhaps moved to a different directory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v33-0-212e32ff0295@nxp.com?part=3D1
