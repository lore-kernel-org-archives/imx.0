Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AE3FADF6;
	Tue,  7 Jul 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430709; cv=none; b=mgPLZHeg2lX5HkFUv7S5bj4yzSomsXTmGGMG8QJ6Tj+L/0OPJhKxn2FSqhgEAGqmaw1uVW1GBl3aV6LOp2D+HMV7rfy/EGSD4BrMRFs1Y3NJUcOmRASD//y4rsJIfZ+bSQA2HxEPYuY8shTyZyQQIGMZCA4OrGKqDV65uUQnNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430709; c=relaxed/simple;
	bh=HmZ94qK61PEAudCnvJmh5eY4NTcDxkVDw0FZWy8z+Gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rm86atGicHPfHpDNf+fPuOAIoGRqKIvnzDkKyuX/iwZIKX7cNfETJdIeYvY4fO+kFn7lSc+a58hFgVbRS0Ry+Pmfvw6eGs0a41LZXwBNHZob4CV2QjrFAsP7FPv8AEPO3aWqGoULnwU5xYfnI9XWb/3vQPfqz0agW4rlvlbsG6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbbrUXeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbbrUXeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F163E1F00A3A;
	Tue,  7 Jul 2026 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430708;
	bh=HmZ94qK61PEAudCnvJmh5eY4NTcDxkVDw0FZWy8z+Gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbbrUXeUh3T40x8CYijabCI9guhMaqxyqhKCXVMGnRAWxkITAle8EfeSwMC+M9IFi
	 PHp3HDztxSyQU6lB+pbZOiciw+L08XPLbhpESXY2/JrF9r1blI2EWFlzzASRtMlghv
	 dh0rkx+ll7Q+Ne23CQEa0SE7GkPG22vO7BHagrbm8WxaX+YkWpL2GFIDc2+kIehzzK
	 5V9zjXz9NqI3RJcqbQb2HLXe+8NeTVJ03WSHfB8aB9To6FGkxvcBOHTSlNIzfPdf4R
	 W7r1i58YTdto2DtgbMAL6+zQeFlXK9nZfqV0Bf0ZaB7Tl20e2xOcZvALbGCHIbwAmq
	 rEwuX36dD1pNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/20] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-19-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-19-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:25:07 +0000
Message-Id: <20260707132507.F163E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node from another device for
> dynamically allocated platform devices with the provided helper.
>=20
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D19

