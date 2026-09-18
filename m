Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2094D6C57;
	Fri, 18 Sep 2026 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728779; cv=none; b=r+uM5DvDmcCvMUuEECr+6SDkG49iKXkg0LHvpccjtC0Ai9jahI7pP6oj7VMIpnQxLVGJO+dOx+p/yqSLmF1c7ybtW2/osxtEIrjl6GbEekRODInVGew5vZp+hZgOlrkIvaqMmyrCZKlypUAN8+oxZbkCFVM4GV8SCycuaL0myFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728779; c=relaxed/simple;
	bh=8LjUBctDOdkqwNy5lqShtcRqVEPWpZfDy1VVDCImrDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YCr2fAObXUHmHKEwK8E2sFEq6YUW/Yk3zyYjTyaOi+CK02ziiIo4GOe7XeYdpBmWuV7mEaw5fiestCgdT60iAXs+Lh5dRqOY+FJ/5GH2TBR6KbTz9XeOwFrV7TGUbKpO+QbSD+X1YB1DJ3oCcg60W6k8gKTC779tJPMCckruxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGEaFveR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGEaFveR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840A11F000FF;
	Fri, 18 Sep 2026 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728777;
	bh=UCFl7Vnd1+TIKP75zGllFhcSMQBL7lUR2IPGdFHAkHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGEaFveRjTUS0XmF9WxCnBcdbgmaX6A+EWZQfAWHwxf2Yeq6Aa+TzmcXs7PlWzb5f
	 tA3zyGAJWI684you92cFJp+zjbzqjLXIholmfBAjINma1SiKNcKvg8B8qF1ASFhG4f
	 4u/1LLhF3Ut47ghU+/fm80ou9ic9fNN1K4v1dksqIynhYNubVXNaIURd2UOICD8J8n
	 neoQ1a7W52JjN5+xQk63DeJVUfWvx1vdg8u31NIcw1Zn7HO5FoGiYYrNdf054lOLkF
	 z/bsly/CtJYZ6WPtJ/7T2w+yrQVHoCtpqGfxx8hbKKtFUiIzCh59iTiBacSlmhd8Zm
	 s9l7b3c6FEQYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media
 orientation definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: wsa+renesas@sang-engineering.com, imx@lists.linux.dev, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:52:55 +0000
Message-Id: <20260918105256.840A11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: qcom: missed orientation refactoring in sm8250-xiaomi-elish-co=
mmon.dtsi
--

commit 118cb3cedc7acc66e33f7606b5faf0d2f7c8525a
Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

arm64: dts: qcom: Convert to new media orientation definitions

This commit updates users throughout the Qualcomm device trees to use the n=
ew
media orientation definitions. It replaces hardcoded integer values with the
new enum options.

> Update the users throughout the qualcomm device trees to use the new
> definitions.

[Severity: Low]
Does this refactoring miss the orientation property in arch/arm64/boot/dts/=
qcom/sm8250-xiaomi-elish-common.dtsi?

arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:camera_front {
    ...
		pinctrl-0 =3D <&cam_mclk3_default &camera_front_active>;
		pinctrl-names =3D "default";

		orientation =3D <0>; /* Front facing */
		rotation =3D <270>;
    ...
}

It looks like this file still uses the hardcoded integer instead of the new=
ly
introduced MEDIA_ORIENTATION_FRONT definition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-kbingham-o=
rientation-v6-0-5e8b1f01be29@ideasonboard.com?part=3D2
