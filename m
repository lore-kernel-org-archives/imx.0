Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A62D29C8;
	Wed, 13 May 2026 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712886; cv=none; b=Wt+GK+cNjob+UAosvcYEVPHJN47I9VIo/DZvllfF2o9eK/VSAYs4OBuo3E8jyitqg179d+iLDvsB5p5D48WLAxUVqQa0+hdcxJOnWP3bWbJsjibb4i+o6IUstA/Euc6BtPZBg4NuLsG3KVmkIEsE/+DVyXt2YXWQsCexXo1fLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712886; c=relaxed/simple;
	bh=ppN4BtPgCISrT1VuAeGbv8M0b6eeB+wblh5mGaVOfEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m6CZOiXD5PjsfP4xpdhQt8OgW00Jx4hITlZNavLFfdF5RVIv/mlJDOXmhOdvnRlW6GmQlzWh7TC9L0W8C+A5nEygGsrTHF+XHoAdLqkrCrpKoXLhXN8NXlXV8xZk3QQ+7m96w5wIKpSJOFqV/TIe329BVo2MKq3cmbN+WJEmT0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnDyw6XF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnDyw6XF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AA8C19425;
	Wed, 13 May 2026 22:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712886;
	bh=ppN4BtPgCISrT1VuAeGbv8M0b6eeB+wblh5mGaVOfEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LnDyw6XFxsoqXUe+pnBN/g+YqaYF3di94ps9xAKACxRB0sDUkKEzt41/VJXYtAS04
	 oBNqbUhlisDxZgkdwJwcxhF+M6f8MpTLOIbwAr3xy5boKKkLqZAGJjpeTXLeTBKDrp
	 duxpFZL1iOCx7J4Y2loAjKvL4IfsdZfjZ4vAwsZ9jjANmfiXw8M2kiqtzumNiVK1Kq
	 OacVgBDFV2I3y3YL1yH2odzHd8i/wUnuvPxNNTK94tJY3Yt/gzwP04ms24XZqr3lZp
	 nThCI/Tiv/+MGpmACamiLznwn0eJ3okXn07e6z8Ud/r4o7I/8qxhW7ZRTee7kiKa9b
	 1DH9m3C8nBEuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a
 twins board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:54:45 +0000
Message-Id: <20260513225445.A8AA8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message contains spelling and grammar errors: 'with with=
 a sinle' should be 'with a single'.
--

commit 2b66fde99c455bef77062b52de3d83d8ee016506
Author: Josua Mayer <josua@solid-run.com>

dt-bindings: arm: fsl: Add solidrun lx2160a twins board

This commit adds a device tree binding for the SolidRun LX2160A Twins board,
specifically supporting the single CEX-7 module configuration.

> The SolidRun LX2160A Twins board supports two configurations, one with
> with a sinle CEX-7 module, and one with two (dual).

This isn't a bug, but there is a typo in the commit message. "with with a
sinle" should probably be "with a single".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-lx2160-pci=
-v6-0-d0ff72d3c983@solid-run.com?part=3D5
