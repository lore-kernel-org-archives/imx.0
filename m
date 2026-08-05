Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F3395DAA;
	Wed,  5 Aug 2026 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942591; cv=none; b=SehUBPj7eRGRb358B2CJa2Al5XBpOzRIjdZ61BXR6oiv3mlrx6jJvFCdk3Akp+HASp1h8phO6lH7i6KEzfnKtkYsH8RWW8hRHYEX0BrMP1N09NBQYzzJ5CXvTKrmgjeygtYw06uQVtkYA8SVNMm2dv8t23KaEj+DG/Nkh/WAxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942591; c=relaxed/simple;
	bh=JFcF3k150rYMkj0ynjXKpXlC/NewhWqZo4JhcpzhYeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aWXlriCKxbWr+FRkRqkvAp/uIKzw/Q76SX7gQAWsG6yWcCTZOC+UZnpCtuQ1Rdgwb3rAeq0AOY1KLrWqS2pLgdu3qKDf+SykH7Y9688EIhQYEzfjep8kko+hfcy0Xt1SwDgaVMadEvYj1ktlkONuEXFJx6opBNrVGLX/XuZZS/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF8IxWo/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF8IxWo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15B21F000E9;
	Wed,  5 Aug 2026 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785942590;
	bh=r/xz57Jy4mfSFLaKHpUnyqxJZ0qjz2Otw/KkT1fCRXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mF8IxWo/wRB3O7Ij5r6gAfrr9hXP2GcN1/KmOEfKWdyEVXidDKk2zq5N9Ov4WESrC
	 ntcQFa2wVMYDyZyMEx47f4UdjfiIvPQskI1D32WS0MJbBV/ZQiLCtNY7SpnBBFo2w6
	 7mLm97ukZ+N8vrefOnpdxAnEpDtR/stWj2WpSJlf1o4VXDofwikdkh6AKnCZaYReib
	 DXZq2IpeZV+R0f6QYNDmWlXJk2bYhxFaGClE0PevS7FXdDYHVtLFVI5gFSZY8PWM3R
	 I+Zsur1lpM84ISeloBGO98UaR+WfizLnKWP6w/FrebjgsPcZ8QsX1oH4VHM6G4xFfL
	 GlK8Wg2Lse2UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 1/5] arm64: dts: qcom: shikra: Add CAMSS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-shikra-camss-review-v6-1-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
 <20260805-shikra-camss-review-v6-1-a8dbc66f0d87@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 15:09:49 +0000
Message-Id: <20260805150949.D15B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing device tree binding update for 'qcom,shikra-camss' compatib=
le string.
--

--- Patch [1]: [PATCH RESEND v6 1/5] arm64: dts: qcom: shikra: Add CAMSS no=
de ---
commit 61ed442ae43c338e75ef6a64a39ccb1fc9e42714
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CAMSS node

This commit adds the Camera Subsystem (CAMSS) node to the Shikra device tre=
e.
It configures the registers, clocks, interrupts, interconnects, and other
properties for the camera IP, which is similar to QCM2290 but uses a single
IOMMU context bank.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -640,6 +640,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
> =20
> +		camss: camss@5c11000 {
> +			compatible =3D "qcom,shikra-camss", "qcom,qcm2290-camss";

[Severity: Low]
Is there a corresponding dt-binding update to allow this new compatible str=
ing?

Running dtbs_check will likely fail validation here because the schema for
the QCM2290 CAMSS expects exactly const: qcom,qcm2290-camss and does not
currently accept a list or the qcom,shikra-camss string.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-shikra-cam=
ss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com?part=3D1
