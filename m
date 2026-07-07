Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008A41A799;
	Tue,  7 Jul 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430693; cv=none; b=nmKvglgzIXa+TNsktQC8hn3C2VQD7gzw5sVwcXRqDLgh6vCxdKC1T8EDM4vCn5yZBWSuR6CUQQipc3RSV8pEq4tt+qlK+PeQ4tojQYozNZccpQo6U/VwdjqdBv3InWuVY2PKO9CVXzt6a+ffi1mCwvon6IEhdUhVWXMlfvyCKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430693; c=relaxed/simple;
	bh=oAxUk++V0ZyWYkuNlXsTvOnE7gFeTWviVdLyqwgBMmE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guGKa1yG4Yisqt2Y45X0DwscT0qg4L8x+B36suCM39ywRHMSTZ5fjEzfE9YP7dSGgesOvE5Y1AF3wYRfet7/f/BioofFX0TKobAp0ocxMB4atawyLzrHUc22xedwvhgZYLQ9I4JYrOyYGicMfLzF9DZJutXTftjlid3YPgK1uNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITM1C02I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITM1C02I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925621F000E9;
	Tue,  7 Jul 2026 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430692;
	bh=oAxUk++V0ZyWYkuNlXsTvOnE7gFeTWviVdLyqwgBMmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITM1C02Ie2m9j9PcXj0slAOPXlvLPfm3YNz79/7TgJF1RaliRDq+nOJyQU9wpmLOy
	 1PKfWr9KbMVc2K3y4+Mpk/I/nygk361+rCuNbnzRgUUZchqCjXdpeodhKypUOD41er
	 ErkJ9kYwgJiqsQQNcWkRC6N3LvXNW3zxyjjk3JDHweTQQy6/p6jTiNMjb3RXT8n89a
	 7Xt8mEm7PrTV4wJge32yiSL5Ma1uhcWokfUUNogRQK2YXXi8Uwufq4Mi7pXkMCoPS1
	 ZrbtBscLvhKcOy8qtyFwln4GKJAmPSPjxI4aCZ4i72p2yJAYlCPsQiua1BFOfdklzz
	 z/NG9n950HvIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/20] driver core: update kerneldoc for
 platform_device_alloc()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-5-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-5-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:51 +0000
Message-Id: <20260707132451.925621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Users of platform_device_alloc() + platform_device_add() must not modify
> certain fields of the dynamically created platform device object. Update
> the kernel doc to say which fields are affected and which functions to
> use.
>=20
> Suggested-by: Manuel Ebner <manuelebner@mailbox.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D5

