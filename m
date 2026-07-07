Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E3417343;
	Tue,  7 Jul 2026 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430690; cv=none; b=iBgNDR8qBVjwNl+JnxjeXvVggx3jH/wBaMAkz2bI5//0JPC4FIuu6ze81nCzaUNq0/9RHVZHV0Bbu/rmG7sZEkic8CdqCCIbgpbUu1l4+lXKwj0EK+OzHlUOFut2xHO0ndv7Bj01fj5/wPPnrzWSOeMImvzPmn5AQQE4zj18eaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430690; c=relaxed/simple;
	bh=iUuoqtahVUZr9OtTw0u0P6Wm/yDgfyTDFGsMt14kEdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZtz6XtNqqgoQGjP4hHqNweuQYUSWWF5p5pgGsFSCqqkav5dvu7I5rt2Uzn6k4Z6qWLyz38eARyDIo+SExSBks/jrds2zI0ZEn1R6xukaEO2IYcEfLGg8eXu2/yzYO0vfl7QmyqI2Ti2UNv7y9qHmUT4RMxCOzorcwGckrEHm9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvRdOfs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvRdOfs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4BF1F00A3D;
	Tue,  7 Jul 2026 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430689;
	bh=iUuoqtahVUZr9OtTw0u0P6Wm/yDgfyTDFGsMt14kEdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NvRdOfs4wzM0kGTNel6tjmaLPbiGFmqF/iaqJd0xENPKQoyevcKAye1gmUi0MypqM
	 n+2hGkd8iIN1MatIZj8+hAXS9YbMEygzAAZEPCZJA9Tshjit+kK0/fLfoW/PbefLdC
	 OJXYWxlkBiGiZghv9el/GUgKLeZgoBM8t2IWzGchoSw9gZqhp3lo2QYksZ+S9LA4VT
	 se/jp4Y2bmI9gMqj1+8U22ZNMpMvp1dHF1u33FFZJRXkvRMwrM0L1HKzSoSw1kHELh
	 r/YXDhAL9dVYvzcOSRbe1GXERAiHPjwHyzU/PFri9GzBUZlt+AQydMdY9WheDTxVce
	 Gc907xhqKkgQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/20] driver core: platform: provide
 platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, imx@lists.linux.dev, lee@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260706-pdev-fwnode-ref-v3-2-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-2-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:47 +0000
Message-Id: <20260707132448.BA4BF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Encapsulate the reference counting logic for OF nodes assigned to
> platform devices created with platform_device_alloc() in a helper
> function. Make the kerneldoc state that this is the proper interface for
> assigning OF nodes to dynamically allocated platform devices. This will
> allow us to switch to counting the references of the device's firmware
> nodes, not only the OF nodes.
>=20
> Reviewed-by: Manuel Ebner <manuelebner@mailbox.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D2

