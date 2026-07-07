Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55C41B352;
	Tue,  7 Jul 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430705; cv=none; b=UeTeh8MCwRrhiFdLMAIKj+T1NGp6ksvnfttkWsV0cupF2w2QhfV1S/XPbf7V4LF9wBzHqnZhPPw/5oot9zoLRaYbozEddrh3sFk3yx5YknEjWkFoF0DGoSGeBL/5DwMd/W4pTgUZoZ2kwsNc+cCC+MV2hbc72ctSln2cQLzCXTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430705; c=relaxed/simple;
	bh=PUva2vPwPVB3jHpmu0LICuALUIh3K0XLJ8i1qkuIXPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JuEFCr4Bzmjzdigh1tK7cdfsw+wBYyRbBz2HKYNXYOzW+lGJa3N0HOlpKkrBMb9+8JtW0ZWzmD1U1+dsGA+91TiMUg8fo1KxQ3ujL9oQx5ZUyBjZBD5fl0wkRCcOfKuWfzqeafCJNMIg2VgLRRz+O1VGT5oeMwqNSpKTuy4jx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmwZaa1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmwZaa1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A68E1F00A3E;
	Tue,  7 Jul 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430704;
	bh=PUva2vPwPVB3jHpmu0LICuALUIh3K0XLJ8i1qkuIXPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SmwZaa1cRdA3bWQTHAX/0WmlBGFu019DkG/Kg9iMRxm86JZNGGBfEOvd/HkblNSO6
	 CHrDO/gFWJB1/32XjJ0KSZFRhi9QmUUyqsN5OVJPFh+qID6ZnQnQKfEsv9tRhiGpCl
	 SA1fxWZnKYMh7fbtdAYCJpmHI+6F9VCykGvJafRR13sUaFWbJNsAfUjljOzF9b3oaY
	 H8t4TIfmz3PKxQbOTzSBjfxB+N1JkWJhgljgM00rJfSRt6E10J2ppfpl9bEatqFPbq
	 M+swcrGmwqSnEQtdRYZXk7/HeShPru7waFnyQTn+oba1ViuCMFcnMt+fBgC4uZ9TFi
	 tDYQejSPzpXaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/20] platform/surface: gpe: use
 platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, mfd@lists.linux.dev, lee@kernel.org, imx@lists.linux.dev, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-16-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-16-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:25:03 +0000
Message-Id: <20260707132504.3A68E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the firmware node for dynamically allocated
> platform devices with the provided helper.
>=20
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D16

