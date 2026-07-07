Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7C417377;
	Tue,  7 Jul 2026 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430689; cv=none; b=Z1MUdtdgCEtqTed40/o+yMRkboUT1fXgJZ0riadYAzJWTxzhFX99ojQNyVgV6ifcOgmquwHcU1pQDraPizo8Sdj5a77xW0cnmTakCaOIRtCMzBw8pUyMVlZutnzlMejsuKhOmrrzpFMjAzVoY4rJZVWl9AlzbLEr7tCDU7Ja/xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430689; c=relaxed/simple;
	bh=LztXDVMDysWrCfGtOMkXJIwXxCaxxrx0VHigrWpYLVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RGKrPXPgns6vs3aNYcMkmtO9YjIVi34x6IDBwPPUBdACwn93psEOn7FVcl7VQsAEXLBLHaZt9gai3CZpxDzGn8aaJPnTeWy3Tidf1tn1ctTaHyOjg2Ky70TGq25XkByPdO1UXBnen7vQUqyMfu9RIbeEoh1h6SxDZVH9Ji0StjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUclSUJ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUclSUJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259641F000E9;
	Tue,  7 Jul 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430687;
	bh=LztXDVMDysWrCfGtOMkXJIwXxCaxxrx0VHigrWpYLVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dUclSUJ593XXWlQv2s53b8xTtV2CvZysUhfHcHcVRg0VnMfL4FmbuL9HBp1FEZf3Y
	 0ug6wg4fcM3fMojMTBh/LlqUp3Dd5078mz4ohARrINN/8c0hXZpOR+sT0UU3Me1p2G
	 iWhEUA+vNUrbN4g7gTg0TmPnrRQnDoI2CZH9bSolWW/FLOThBQQl3VA+lgkfJ1269Z
	 exZh3nOAUofz4WvnpXKdX7mSRCP/bs1aj0P2OKyOlV96ICNJZcEPhAkUkffORnI2MH
	 G1dhagk5XcnDU6o0K3OKH8J7TPEKyRd7ZLS3Um1r71avKftuevhONWsacV79mDZq+D
	 S8Pl8rbWiDV0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/20] powerpc/powermac: fix OF node refcount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260706-pdev-fwnode-ref-v3-1-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-1-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:46 +0000
Message-Id: <20260707132447.259641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Platform devices created with platform_device_alloc() call
> platform_device_release() when the last reference to the device's
> kobject is dropped. This function calls of_node_put() unconditionally.
> This works fine for devices created with platform_device_register_full()
> but users of the split approach (platform_device_alloc() +
> platform_device_add()) must bump the reference of the of_node they
> assign manually. Add the missing call to of_node_get().
>=20
> Cc: stable@vger.kernel.org
> Fixes: 81e5d8646ff6 ("i2c/powermac: Register i2c devices from device-tree=
")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D1

