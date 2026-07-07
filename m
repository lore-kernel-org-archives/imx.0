Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C38417366;
	Tue,  7 Jul 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430696; cv=none; b=F5BEfohoHC6/obGeRwEV4ves/u2prdogV8NUxzHgUGpeXsuGXrgsDOzugVS+Qe+EOVXERHxnBgBLuuyCFfXe0jYKeYfUH1KZWHRGnoJQU/cc6Uo5C7Lnk/gOCvBrSzw2KWgu+6jNH1x1uDy/qnXXv4md26IUMuQYfVx5HxhEn/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430696; c=relaxed/simple;
	bh=ttpy10rWjk+gG9dm34IWLNXlQeh+ehFO5FGYraY1S2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZ6jnjpY6kBPVz3phnmrXjQ78iad7Fe1KRy5thB0R3cMc7LFNbM2vU18nUjI0wpcThyBpohnjX4ruSiKoUDfTy3hXTl8Vb4RWY7rkE9ibT3Cv3679Ox0iYNdO6Pz0TAIq+/JdqdBEx1kVXrTPAaOkCK1EyOCSMMVM1kfvJNEYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcARvHiN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcARvHiN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933861F000E9;
	Tue,  7 Jul 2026 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430695;
	bh=ttpy10rWjk+gG9dm34IWLNXlQeh+ehFO5FGYraY1S2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JcARvHiNl1Ija2xEh7DzufqfDIPHSL4wvOTk1MhvH4DYTIgjoyXgmsDUDPV8sL9Lc
	 AywVyBl10X7ZANRVw6TqMdjJZ3ZJns6ixefJD8ZmXyEiwAmuTcTayiQ4dnMz6XWLW3
	 +TgAomGldo/KfuvcOgeYT73JEll4TQM2+I77z2tle1CtMrDqbbAbq9sKyoOL/aiJFP
	 ps2XHrNWUvRnqZ8r4fAL8onERk9wkSHOrLVnG2J/Kd0ykbH+R1p1AeT6kxdJjiQmE0
	 xGBj47EGUAXcMIZ3mW4q97uu0q5YbTsxlEGw8++pYpUetVcedznVAu/jnmZ54m1U5C
	 /p2uFMSQ9v0wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/20] powerpc/powermac: use
 platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-7-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-7-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:53 +0000
Message-Id: <20260707132454.933861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D7

