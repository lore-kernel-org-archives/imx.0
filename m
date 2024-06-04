Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81A84A33
	for <imx@lists.linux.dev>; Tue,  4 Jun 2024 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524846; cv=none; b=qQC2i7SkcHdv3KNVP+uRfvNypo6oMQwCV/UWZBjprsPXVbVwKreYbC43+qJKLie0TviA+mCeXBYJMUAFWIvP86AGtNIlPKozBAmwVm1yvFjmIy0pmZrgh6SMYgi+bIEzwO7V2cRhyKW/APzEwlNkslGM47jbcxG1Pzw8as5GOWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524846; c=relaxed/simple;
	bh=zprNLxxXrGNdjRroO70rIrHz8BIroNnj1HM6tE5B7HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QE8RoAb62nj2AGmFmpmTu7YFdeSJG0qXqjpEKmpjZJfPDyIlR0y0ww8gWnd1wfirdujWsi5DPvDWutU3H58ZkniDNFiF79M35LXyaJz6B+Cc17hzcwn/w+TsroIU9wuJGEorY0YtL0zMoTRqg0cTafGmJT+nX8GsbE1s1uQ5tHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/uaFKuE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/uaFKuE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c1afeb259cso918595a91.0
        for <imx@lists.linux.dev>; Tue, 04 Jun 2024 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717524844; x=1718129644; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zprNLxxXrGNdjRroO70rIrHz8BIroNnj1HM6tE5B7HE=;
        b=i/uaFKuEjed0oj0XKIZRaE+rTE//gd2t13mFXerqPXUsVuLNKgfjrHNcHh3B8ps3l9
         523k/cm+FYC7+roh4WlgFdO/2ZMfSLRtFKalWCZJ1SiYRqM6uBqXAR78r20/VenicWPj
         fDW5tldQzqf4PFLvqRkE4/g6bvRzSOCbCVc/UYI6q0Bu2+KQCLO4GBv4ub7AUzTfh4Hz
         4NRD6A2vk7T15QZrhucCq9LIaibTWorQRWUMfzZCRJpLa8jAGSBQqnTRBh+6hpHALDSh
         OI07+UQMldilEeVdouhLv3FcE3jg317XA91MDycLDNItJ9AUtpI2gRGoEOSh4+3OCeDH
         wfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717524844; x=1718129644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zprNLxxXrGNdjRroO70rIrHz8BIroNnj1HM6tE5B7HE=;
        b=TNWOyJI6a/7ntvKxaXhaMxzOplc73jKl6V5rU5YufWuyGg0zed39niRlAvHWCFVRwb
         C8NS9gEnHHHn0yiLrb7NmwbPXuDqKUa5wenTnuzNHzRuGsY/iKFBtw9RURzzWhzHLJnH
         bQXDt7YTGNeEQIm/G66UrapP2zUVSr5CMU9PrUmfcy/xN0V7A0OROBlDWY4zL9xidWQ6
         GBX+H4YN2bvGXqNwiKZcLAxvjQtnfjLAD985rDxfKWBAh87XZHMgOyv3RVO87UM6OgJx
         HFEcXOw022QNZxzQh9dJ5k4s/JpkDtXSbgRhspZmhNQzZ1MyURgn0N03y18lqziBIZ4Z
         BlXA==
X-Gm-Message-State: AOJu0YxLYYAipU8YZfrQIJGUMrsuh6JGqhO7mFnRBiY1eW+nZpaoWqYL
	84fGcuOCsPNuPKXrO0il7vg88YFVlIF6buoA2eZK8rBmP1vzuQAOWCmGYdOr0Ht+GJESoxzz22s
	0BSS+cSuumRN0tw48GUWKo+JF+zo=
X-Google-Smtp-Source: AGHT+IFJM+RSuoiIypFqZPEhI6YM4SlfusXmn4gOwq5yZZsDMMR2koH8xf+y9YPZMVAT/aQWW9uZZuGOdowU5V3nguI=
X-Received: by 2002:a17:90a:d308:b0:2b5:1cdc:9ac8 with SMTP id
 98e67ed59e1d1-2c27de728aamr211122a91.4.1717524844301; Tue, 04 Jun 2024
 11:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
 <DU0PR04MB949617775A095B8DE513D97690F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <CAOMZO5B7Zm1RXRLXs=_Re_onUam=RCy_QYUkEtGz+qvKmz=7Ow@mail.gmail.com> <CAOMZO5B4cuE5QMkjdWnTJFCs8kY_cK0q5O3xujnetfCfmJQHSg@mail.gmail.com>
In-Reply-To: <CAOMZO5B4cuE5QMkjdWnTJFCs8kY_cK0q5O3xujnetfCfmJQHSg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Jun 2024 15:13:52 -0300
Message-ID: <CAOMZO5BbmTTQ8OAPg8jE8-CB94VmjBB+9+9vmDtQYkL_BBK5Wg@mail.gmail.com>
Subject: Re: imx93-11x11-evk: SD card is not detected on 6.6
To: Bough Chen <haibo.chen@nxp.com>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 11:16=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> Today I built 6.6.32 again and could reproduce the problem:

This commit causes the problem:

https://github.com/torvalds/linux/commit/04cd4831174622f545fc7ee79ead38ca7f=
f04c0c

I asked the stable folks to apply the following fix the 6.6 stable tree:

https://github.com/torvalds/linux/commit/a73bda63a102a5f1feb730d4d809de098a=
3d1886

With this fix applied to 6.6.32, imx93-evk boots successfully.

Thanks
