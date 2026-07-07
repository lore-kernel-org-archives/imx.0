Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2A0414DC1;
	Tue,  7 Jul 2026 13:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430692; cv=none; b=pE7vEY/JveMZDzv01rJHDY059Fwz4Iz1zfdFhMF8mHFBhoqm447Fm3tPPXLyVWUX4ZAle5KbJ1AFPm/AVK7Et1CINCikvE02jvNmrXq1xaEy6aNsuqQGNqAyFk3KwNY4IVu8LGZ1lwWvjB8WnNCtXVnr5iQ++bLIbtT0BXj2Aug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430692; c=relaxed/simple;
	bh=f8K40v15474Lyj6aQ2owDQdvjNay3Tkw5dMYAJ7/Um4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kW8DiuUiaOEddk4Vbwt9yjz1XeEuRHFJzqcF3RpM702m5CcBQ3tKMLE6xv5IKZzBkM7FstwO3BUfHxkTBWaSZGLS+t4bMSUKnx14wFsyc95fYjLOfT2HXbJDqkXhEKI8p6+mFkezj5GkRvRcZ4yW/Dc7QM6eZHHP011YqUs4lKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tj89kf+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tj89kf+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872321F00A3F;
	Tue,  7 Jul 2026 13:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430691;
	bh=f8K40v15474Lyj6aQ2owDQdvjNay3Tkw5dMYAJ7/Um4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tj89kf+1bv1fkc2o0jtLyy95Ch2odKt2Odu9Ba/2bxl9Bc/YKx05mZy70dzDq3BW4
	 9mnz1BZbKTluES9tQa1MAmvB+e4K+wEJLWtqR29yRxK7yJdEadZpM6u7eaMD7POEtP
	 E4PMgl6aBpV1U4ISxZcCTJmBXRFXGwwZiH1fuScFJXHSn4m5BAiBfNC2lsemaEUQvj
	 mMI26UL8xSs6DeWhHyRWa+GL5RQTYXD/8rBpGQvgEI8wSiw9RFnvatAtgHc+YP/50O
	 +/kY7FoRrwSg7F6cZN1PvHD35U399rV+dZkSLiYFHxHbWo/5QuBOLhQmiICTPAByAT
	 BfVhle2MNco5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/20] driver core: platform: provide
 platform_device_set_of_node_from_dev()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-4-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-4-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:50 +0000
Message-Id: <20260707132450.872321F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Provide a platform-specific variant of device_set_of_node_from_dev(). In
> addition to bumping the reference count of the OF node being assigned,
> it also assigns the fwnode of the platform device.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D4

