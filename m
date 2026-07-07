Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B507414DD3;
	Tue,  7 Jul 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430691; cv=none; b=Sej4ln5Km2I3UjlzdZ1qfdzP/qYL09kVDmsGXg56tHU2caB4DbPOs0yqksryvjLnc8BBockkbw7GbmmAZlY0UFUS6UiAaDMLGB66Z0Em0OpM0WN1nogId72kwULPRUIG1LUxIydFAjzK6QsM8LWueTHtoH8xTgBrKBAstDKnOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430691; c=relaxed/simple;
	bh=GlqHFrjdlNIErYROMXfKwasPGQ6xm8o4zGv6nz9nAoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KiCThlXpFkixZRXoVxp08Ve3pBaGvy2dyImA90z72dqETVXIizMUHGDlvg4yIMLFz0jk1bkmp3eTQOX0Zc8wlSnJbtVhEngWxBX5/y4MmmfI64StejnA2bJOYg5cEQxCOKjlWDwO41Uh8a8hk+criOQzERlTzo5iCnxRX0DRfUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koed4iua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koed4iua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8451F000E9;
	Tue,  7 Jul 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430690;
	bh=GlqHFrjdlNIErYROMXfKwasPGQ6xm8o4zGv6nz9nAoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koed4iuakklkKmsiiqhNDsLCOwb/Quq11U+L37U6sTMJfSCom3+qSW7/d9xGprUhc
	 ZK7DvEai/7MvcIkAtYPqC3zc4xuiVMW/qCIkChly7j2fa7LAkhJPc+IKtNgImpj0L+
	 MsEiG9jNTK9pEAjmmTZwYd3c75EqM4Yacbq4P4NCMCHn83l2fUfSOiklpFuVc39KWA
	 wnBROUs4U6K5V//0l4oGrgtJ9jUwynEU0pZ+8uFUTZg0nyW8kGuup0C/Fa7+nrCM54
	 EL89VoCPmkoJPwwJJTbuSH9B10aS7qZEvUM89471qTHse4iSPRbMbPBd4UFCxeESmn
	 3Yd7W6GSxzFsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/20] driver core: platform: provide
 platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-3-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-3-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:49 +0000
Message-Id: <20260707132449.AD8451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Provide a helper function encapsulating the logic of assigning firmware
> nodes to platform devices created with platform_device_alloc(). Make the
> kerneldoc state that this is the proper interface for assigning firmware
> nodes to dynamically allocated platform devices. This will allow us to
> switch to counting the references of the device's firmware nodes in the
> future, not only the OF nodes.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D3

