Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E90736654D
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765472; cv=pass; b=BvMQ8l/VewHyERK2Ka3Ew1rCDKjul7sgo5WqAxdft8Jsl6dn96YhqIBmU922ln9lIkQTGHy6SVD7nxlHe0TE+Hot225Yz3BVpfG00YI5crfKEv/KyXKg0jVNsokRCtTv56jCqTHA8NCvLzaDAgxQE4KX0VSEGOJJfg38d5GvRRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765472; c=relaxed/simple;
	bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9JFr/WPa8PkfPt1iLnTp5DKHGhnJ3o+a2MMgDrLaVq5RnwNMUgHhxWqCatnXPLQFGpzNwzjrLKSPweDIe6bID9dTjpgLIOWA8boJMmx6mRqmVvz21ZGvusqCdL9FqzGsmNPYwOTPTnwjpB7S+hsed5wQY2Mr6YTpsmUtUuE1z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSkBF1MA; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSkBF1MA"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a32d36396so11269851fa.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 18:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772765469; cv=none;
        d=google.com; s=arc-20240605;
        b=efzwF8r665V8awmpaRD2+Mx+1+t6dzbjSvkm+rxga0qdJA2HVVaNjTkOb1Ck8dq/Rt
         fkCriAjr1UIQLeaAZQa/5wgzcFpwDuEN2ASfuFEPbAY3TlbUqa9xGYO1WMukMm+FXxh1
         Ipgjk+HJduHQrVw7+5/kwQG5+xhmRun6vmFNMK9tS4Y+r9F7SfmgjNMuygMzWKDeZ+um
         Ibvh7qlypC0ldoh+nl3+ImtxWxS4FX8PnoW6i8s4JdusDMn+NrFySt9o1w87u6nRh7S4
         9YPbeLFPgw0iYGhUNzmni9684YFkPbhwRPlgQR7cyZlLMJHP22JK+gZvxDformjT9akW
         +LRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        fh=sA2SKQgqe6aSBxEDvlpW/FBdHATO5DPWpt5aRdA/s1I=;
        b=Ie7PDZcHqjhi3B2uTo0bn9Av3EQg4Z29GqQLzMVxw7BRumKFkbceJFYtAqTIvkt9cU
         xaeP5+HiaTtWnI3ftBn+UZmYaJagp0BZ3n8X77fFLsWsG8X0ZGuns9DeEGgFprr9yIn1
         mTXewo4A7+UEofVMrTXR/xc8/Ee4IWQUqum6Bvkbmual7WeoNdMeHqXzfppJElBN+rcD
         l8Gqq9YjzTYCQJkzVoV02gqWpeU2keXN9NcOi75Oh2aL0C7A4rfiMAJMv9n82JKbZcE4
         HVG2jvz8+/0ODLgZnHWoyI4CdhokdEnEq9dhmktEJjMbLNlQE8GROrmXUeHSrEGx2cKR
         5ahw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772765469; x=1773370269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        b=gSkBF1MAKEmY+Q6YgqMX2ZH5N2ZTHeQIEcuNU4lpQWD4Qn28UW9XCZzhH9M9EJfScQ
         7cIcGSOjUmYNa9nBinwJY1ydw10G6oqzQack6XzodYXNtwmXdB90ATuukgVwxWX6Sf29
         b2MW9f5gr4pCGsLwMrqh4AghTNs3vTNXiv49+H5qi1YeZ9MDjm8Iwy2sNQy1BCa6VHzH
         H6lPHSKaVWVT0UiXj4jUxLf6eU7uCeUnh/0uCMfGoy7DdLHStSyDDBZwqhbc2dhEQigf
         QDZf7GGTadlKggtFL0VClGZBoZpziXXHJiIMgxBAspOUyKQ5dcYKrdy0bfdNMfRDYlM9
         AHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765469; x=1773370269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        b=Tzw4wPxGdkCXDHtBJAVijenBGA1hBX4Ihlt+gVF9AshdFSApCvRthNiYY85F8/TCpV
         M0T71WXR+u0qEjpAEoytnNLd2O2Gw/Pa+9Q4pSrUuFeafIAiXx+vJVwKqseYeY2EEMcc
         rZmdBW/MbPjf21aoXtBxErPaKWD/J34094WJnZNhVnZY7h9t50gq4HOll44SCXgl0N6C
         yj7jYvsnqjgk1b6r+pdg/NR/RsHCzhmUflXk91QaT8ra/W3yjs+E8q33GZ4/GkN5wICl
         i5q6n4xHtqPfVCQIm1R3m2XskVj3Dt0o3d5E1lSYIrsnpWbE86mUxXkoXZ3sCAV4XKkc
         2mQg==
X-Forwarded-Encrypted: i=1; AJvYcCXR7xYCziWQxUKQqpfpz9myGDEnPmVT6Z/u5n0GCJnC04TWPusEBCBySd0gBBSZ+VTNTJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YweAdp9A2zmj506KfbZRh0PPPhUjHv/Wb6oe5txwaym4tCO2w0S
	ap9RJNQSeAlc7hKAZIrp3lV1rn5zz03Bb/lTj1tizNwQnN42Lhoe6MvYqCgDbf5uNghq16YS5Y8
	U+dP6cXzwcRP8gEQSK7cPhoRnW6czw0o=
X-Gm-Gg: ATEYQzxyPd9OOQmo8fNWkKgx0dLsxud7N5db9tqqg99o8zi0CDyl2HX1i+FLFWwv4mB
	oXMUdXmun0/VfPFahC9gr2DffJTLjGIxz4x4yko/vaGCpHNXyynIsgWpb9svgxQ+KLEJox9dr16
	FHjUjGKvLKlAUqGFWHphpYCUx8HhXg+6kNErGXJlyQghNKQRvokIIsbu6pHeYmiRmijBat7sp7Y
	05r1ymt3Mn/4WY6C6MdRktOozN+hUyPQAEjtcwnRZz/UmHzDq0Uun9D2PBUaYBuxJYvqtLtvNUw
	Rx0K5OhG3Z+sUlK7+218QpiWSQkFoqfxBXOI+k+eJitZQjUJoxD+fO5ltmvDDc7wMCGzBGD9
X-Received: by 2002:a05:651c:620:b0:389:df67:64ef with SMTP id
 38308e7fff4ca-38a352a4a0amr11338661fa.20.1772765469411; Thu, 05 Mar 2026
 18:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306022406.760-1-ming.qian@oss.nxp.com> <CAOMZO5BP2aLD+a1r7hVd3F4Qvfovxb8PgQfzcVRKknBHWYBmtg@mail.gmail.com>
 <61e260e0-4544-4c51-99bf-c4815367fa94@oss.nxp.com>
In-Reply-To: <61e260e0-4544-4c51-99bf-c4815367fa94@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Mar 2026 23:50:58 -0300
X-Gm-Features: AaiRm52ueFUXaqQfpowdXyDTPs2aKgG6aHElJW7IWO6H3_-P9HAhh7hH09TPm6U
Message-ID: <CAOMZO5AYRWBykSdvogO0Ea6JidjgY_h5drnBpcDNFrU_oo_L2Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:47=E2=80=AFPM Ming Qian(OSS) <ming.qian@oss.nxp.c=
om> wrote:

> > Drop this change. It is unrelated.
>
> But without this, the checkpatch.pl will report error:

Please do this in a separate patch.

The goal of this one is to fix the kernel panic. Don't mix other
changes with it.
