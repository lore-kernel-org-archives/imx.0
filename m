Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E72FD7D3
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694762; cv=pass; b=E1Gvgk0NrnxpqE73XcGwH35hlJ9oZwLRltZKIkcI+93tev5qrmkI/jWu7gnHKOBbwDQoE49Nv20pEAkX2/WNvCctEN2Z45JWL8Le7AYB1JJxsk7H0t3tuKnKQaxNKB7X8gY7DiFaIR+nu2G6DYN4ytA5MRaIagw2WCwUW9Z4pyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694762; c=relaxed/simple;
	bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSHHK2d375NsEHDNPjN5/+3j0xELSK6uK700TU+nEc/ipAfqgQcNvkcIvfEHDwdbHNlID6VrpLMpp+sHRyS8JNVKgD6T/DlJYwEd8xF1Had8p9jaqenB4XvXsVb71pvQAb+p6P+goJ9ngPSIMNMayWjMwUTZGjwElF9PkZKLEvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHyBXD1C; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHyBXD1C"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b29599b81cso245943e87.1
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 14:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787694759; cv=none;
        d=google.com; s=arc-20260327;
        b=NUWwi9/gSI3aCIIVUfgwJ/UWidVGX4zFvHw9Gu6x1jglIgMaRimR8wGsh296u/kANc
         ONNNoS9eRgGGdsZ6oExtywruRNxVXhfMT9xihRG5pEUQoT5xQKFlR3oKKG0cnbVYt+ZR
         VsbdSJVSkKaRH4NhAeGxZmJPk5eL3lLViImnS+gEPqxVbhhyruZAtttAFhhc0hhOodui
         rt5kAjZv1yRU+iCB3jXtA5eYGzlZzi+MT3+aK+lY+6OQfHwvaXT7IO2YsDwd9HiCKbYT
         iXOu/ll36aCofL18zOOI8UPVQmWRtldmA/C2quCogAOxHHUc8UA0Bu+hThniLQ1LX2+/
         kWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        fh=B4jO5WrFBxDv/aDycVv0Ra+x4D6glVSa+ltJh+jwUPI=;
        b=p4xN3hoBMoAdyUyzZQDKQRfILReHHBiUwiM3PykBS7mogr+o6wWYJHUvpwEPK66p3P
         UpFOdoKfCMk4AjTBQa9LRb1wngbOmNJgTF2kGE3vuKAL13CzhoUt5h9QyJYBDFR9/02u
         68K8/FSO62zzJiKnqd/rCzO9kQSKD8pW/BLzQwtok6iugLda04CgVp8m1DmizSn8LYjB
         bWH65thglIODPRrb3zAFogGx4lHfMXi++fEkmabGfAAWsZv94mcmNyw0DOXoDOLLSYiA
         6Gjezhzfgoj3yu3jSKW5MJPar+TwEi4w1/kKH84hQix+MY/9VtCwMb8nm+s70iEb/CZU
         RTyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787694759; x=1788299559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        b=LHyBXD1CK5Hnh/EwE9mq5u9IV2sMa+tA2Wp+fQJ6hdJ5RL1AIKMand91oaMMsZwFEG
         fPtRpj/Rlt2kzFXJumxaNgeYFcQqev/a9Sczkm+dv/l8+56VYX0Xqf/+YtMpjX8QOUDq
         ppsnQMzZSEsO5STjnK/nzuC3pUCxNmV9r1hIpXXauACRY3CO4DtURKxsysPFh2iMm9Ne
         i3G0oh+T/oZhi6GiJ/BtOAQY4KrvnYIsiatxuBwVhZxbG+wTKD8ArTamsLioS3o0wyaS
         YjFDrmuXFXiP0SP3s/pkRMKmgUSh3/FFvVTKVemD8BB8hlxbQA2zqq3ybHJw7kuXBlrF
         KoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787694759; x=1788299559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        b=J8hFo2Oort2iRV5XT0J9w7K8Gi4Fqace+8dsd4wIG7FSct7wtCGtk43zC2poIBvW2v
         ahQH9jQ3/d/yIHDhInvVxBTs0Zek8F0ndVtKYBPspd35bnYBqnl2+bZicYYBY/fWMm3G
         UmuX2YDiRbgjOnh5m0TB2kPnK464jp8nFg/68zjagGtVPWqgr8P0CdolgvCFCuZIIhyP
         BbbF/6Cny9e6s8bvpdEVfMrVIqWosO3HTEe2fYfDoDfQBDPqiP0ewbSa3tGK1mBR0Ll2
         yax/OVTwJ7IC4qRaFms0E8plFR7vIScLOgbKNFAQis2t+0b0sC1e7PlO2fiuK73ApNsP
         JaCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJtsWax9aNQUaMCI4qynUlu/Zbwn/GdbbHbDv3Q91Y/t/6fd5G72lkpGQaXp+o9YoOOUc=@lists.linux.dev
X-Gm-Message-State: AFuF++kALQdubWU8CV3DPh7tVo9F47bcT9enu3qKA+f0+uGQN9y5m0Ut
	ZKjCRwPGlRot+p6g+oQ20q3tlIS5zIJ0oPlogYw04lWdQO7glOOILvpeGff4OL5hEliDM+qILyx
	9Hc+Vah3+ktFC7l8VQIYb2Nk9jmXaPHc=
X-Gm-Gg: AR+sD13M/XCXz3OJ8dBsikhrG+3mP8K91cVIR+LMPurByemttWjRGJhJgS1nuThz4rv
	ADwAKNLz6YiovhUdAmkXiTJRUiv4wcqlWVcydIcdn3pERTBR/uzrDQIiyuaIcUuL4+tiIy0+//w
	cC6l2Vj01RingCKCGVMIWIL0orRiAmyfoAiQ89PW8k83TQuBFyf9MUH06bgcr4oqOxZMvXJix8Y
	G+7zmdD7VkHT7AsbkDaPBABqyWl115t4eBEAhTS+gjTVXHQ3ZQ1QDp8ov4hoa9sEYLReBHq3q4w
	924FbrtH5waismBct07gYWOEORHlm7CzcQrusAexv0y6otkZYg7eNiM9xJTIukqY0hD5DaEyMYH
	7OXSHFnPIlvA8WApEZ+yl39syaNxAifTgZg==
X-Received: by 2002:a05:6512:145b:10b0:5ae:b260:cf47 with SMTP id
 2adb3069b0e04-5b4a900f79cmr285294e87.10.1787694758497; Tue, 25 Aug 2026
 14:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com> <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Aug 2026 18:52:26 -0300
X-Gm-Features: AcwNN1VZbn_T3F-FXzxO3As2xrvYIwwIKPf7ufPYVHOZJ70yk20HjiCElkvOxsw
Message-ID: <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, elena.popa@nxp.com, cosmin.stoica@nxp.com, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

On Tue, Aug 25, 2026 at 9:11=E2=80=AFAM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
>
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * up to 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
>
> The support targets revision B of the board.

Please add the bootph- properties as well.

Elena plans to support this board in U-Boot where they are needed.

For reference, here is a commit that adds the bootph- properties to
the frdm board:
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/commit/?=
h=3Dimx/dt64-intend&id=3D50c0d934698f7602d579ba21262fcca3643c5464
