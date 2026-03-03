Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEE3CC9F4
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555669; cv=pass; b=hGLXFNSo2UyXFApOzEaJ9B9miJP/rSDgi6L6nbHz0UXAmuu6l7YyzMg5mKyVPvzARa8Y62Fg+xo0lJ8knq/ryEdXO162FdbWdXKMJeqh563HZqlrdoROZ6alhRBE9RfEiEZmzMi1jBOXOu55ionj+3bRLVU0SJToGS55RO5tCXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555669; c=relaxed/simple;
	bh=YfpJerSZNcEs9ES51CQUrX40G1QuMUASx0dNHuE8DLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDfFd9WTnLzYvhM3lRUk1jFRtmxXmbMkir/0WPQ0rLi5zPOZTsdw3WGKsMHsZpTJnZglngZlvfK1cSVvvpSJmw9MAaUxRNjT3+EAt0LTJCNc3TDeZDBh+yPA8Hh4EVg0XDukwjL6lAlrqFCTN1adiBiRyVTIDs0AU9aMhsSi0Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=iCarABmd; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="iCarABmd"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d596ab0917so3592679a34.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 08:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772555667; cv=none;
        d=google.com; s=arc-20240605;
        b=ViOeyuHvrFmS6pQcISqiI8DWeticpwenhh1pnZjZ44TMIrpNr0CpdjWMyts/7uzkvc
         dEeiAHROp246NeziKlrNt3S3Q3ZYla5nnpNM+tJ0tDb/zWAbnzE2NgHM2hNfTJ+Ppf2o
         ekHmeTBbURZzaCm8cntHwqVSGmxdeykt/P+VGmfmYDoG92/5Gp/uUgt5jtE+M3kMMAEJ
         M2YGkgaSykPJUUTS5o7m+Y6uySOYAP0Hc69nsQmsxI0atwZI9fiObE417/5wnrromg61
         pqrFE+cc8c4dcu8JLMqL+PBn7y2ufJk+mlAzKRWf3a/onWi3bm6/7ndhdEmP1Nu7C65N
         xyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=;
        fh=wh8glsKPqXE3Cubf0Oo/gWYBRm7+yKYpshHVUUjl1nY=;
        b=Qx7BMGYYb2P7moLRtvOjDZ8GBCsX+2wXCU/h6T+hMrYB0MoVxJZ3wMD7wQNLj9EPOK
         vWM98U633H9jvRWpQIG/vjzOqv2WpZ4C89Z4/2XYiRADjGcDs99GD8dLjy6ZsZuOHst1
         GXqmGzNPuvAOHTbtqUb+k2x3fUFlZ79CMhz1Ni7Y27yveYvguvCZvd3IDIp8xlMF4T7q
         xXK2UpcoWxzQka2tRRxvHX3SI7GNReIcU02IOWa9AIuDhQh9cbZPiJQ2FQdYz7KBJz01
         QsUOq37U+zCZoJA20EgsxGRgheHMhkdNAqAIeyovHCDYpSipws6KKBomQ95j3TuvOm/H
         1nQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1772555667; x=1773160467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=;
        b=iCarABmdqFJdx4609T1A2KQ4SX6MSJu9K1hydNDIxcHeF09zNUhCB0r+VHsEl394fi
         8S5fG8sBKoXprbEoO8zESJl+fjU9jjzTLyZkH8qam+jtZMQJmeHMclkX5CYBKfBIOJDP
         m6zCuU6KmSnIp+jRr6CrV7pEWeWSv3jY/8nStbn50C10w2LeRFt1Ofi0RKoQ6aPQOQg0
         jKZXKIysWEsARpOkznLyGx/AyGdsy7oHXlFUcC51oY+skT6xAHXkEyvsJdh75JQmhqur
         vMvIPOXk9L5ncBdg1jCC9yIEkCUdy3OoFr333LYiSCnVz0ctSnbEDWeY64Kydn7eqhlq
         qWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772555667; x=1773160467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OInpfxdiwHy6VQDY2/Hp0QyT65G097CPkyEA74gq5QQ=;
        b=D37EiFBTlO89zOZG9ciOplqbfVCGdS8Ewu+sfSWrH6pBAzSp5VbyX5ZH824OFPRX/A
         kbh9giO+Jo/C27W/PPI6AuEAmUaFSGrqAblZJc0nHMUxSq9c/mtmBh3C70GUgAdO+hS3
         fQ7kjkUE2fPmv9q3VtqIIpe0jtOwoew9SqfXCFB/NA5TjtZ43In1RUKBPN7vzEH7i63q
         ja3/8YUyhomT0yQMxFPZAJlLXb6cnxNaToyg5YYKvi5Et6iw8ylPAPBXCJWXzt9HmOhq
         lGDljecH4SU0i34Fa3KHtTfFsJh+V5udBdenJ5aovVWU1yyw7khQ617jJKIa+Se26nnV
         tixQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIGYHgPORE7ncyaC13mNsagMJb/N67gnwhtqZGTrTKgTPm0GuJvsZVJqVdFVZ6hFJ+Cyo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzInE4xKvaQBUoCLUoDJriwRr1+9q4g0txBKjaq20YIMtTW0TJR
	tQk3MTyh6OmRjjO7ieqB7vyCviEzHRgXBLPbDZej8ljiswfoH3BFL5ucPgdXBhEJP4HN2oqgUi6
	YvzN3GYTHfFJtTagg/IBkjD3Xv7dI+wXxu/C6yZ9DsA==
X-Gm-Gg: ATEYQzwCOXv+m84V5jE6y2QdEY6DMOXQqlnChumiRgjAjkgGo4l4Pcx7jMyZS2zwaqY
	IrfcvFrsb9szUA7H+rVt9oJkoYw+c9sROnSFnbKGITLKrKsMho5Qkkfjr8pkqt5rshPsOvGqnK9
	dvyV2jtT4tUKB2Y6wt7dvgI7XF2FU2CDfxp1aOZNwqbwEqODQXE2EPIxErkpIytlYHvhjh/5F+B
	+fdlYhHPjuqadtrWbnu9fz0wf3ITZ0C+6N/UnlZxdkyAglK5HInsdHyumyMJwmW8J05OIemGseE
	MMNIePU=
X-Received: by 2002:a05:6830:6e54:b0:7d4:8c9d:dd2b with SMTP id
 46e09a7af769-7d5be1fc888mr1174689a34.0.1772555666720; Tue, 03 Mar 2026
 08:34:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <23024521.EfDdHjke4D@steina-w>
In-Reply-To: <23024521.EfDdHjke4D@steina-w>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 3 Mar 2026 08:34:14 -0800
X-Gm-Features: AaiRm50Px49HlJBebz525BmL7mRczLSo_5VnSZhLsGQrektayrJby8PDCB-XxsA
Message-ID: <CAJ+vNU1m6Uw8GrXO5+o6UGRUwcXrVJJ0BSUF4rrqLN+RsL6Mrw@mail.gmail.com>
Subject: Re: i.MX8M Plus PCIe link regression
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Richard Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 4:38=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> these days I noticed that there is a PCIe link regression on my i.MX8MP
> platform (TQMa8MPxL) running next-20260227.
> I could bisect it back to commit 9c03e30e3ade3 ("PCI: imx6: Skip link up
> workaround for newer platforms"). I always get the following errors:
>
> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error =
-110
>
> Connected is a Gen1 PCIe -> Ethernet adapter. Interestingly a Gen2 device=
 is
> detected without issues.
>
> Reverting 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc and
> b9a8d28ebbf118bb3eac953f4a37abbd341257ab "fixes" my platform, both Gen 1 =
and
> Gen 2 devices are detect. Commit 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc=
 is only
> required for conflict free revert.
>
> Here is a summary with outputs:
> Gen 1 device
> > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 01)
>
> Gen 2 device
> > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > 01:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 PCIe SA=
TA 6
> > Gb/s RAID controller (rev 20)
>
> output of "dmesg | grep imx6q-pcie". Common part for all tests:
> > imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> > imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> > 0x0000000000
> > imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> > 0x0018000000
> > imx6q-pcie 33800000.pcie: config reg[1] 0x1ff00000 =3D=3D cpu 0x1ff0000=
0
> > imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K, limit =
16G
>
> next-20260227
> Gen 1
> > imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_STA=
RT
> > imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with erro=
r -110
>
> Gen 2
> > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
>
> next-20260227 + reverts
> Gen 1
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
>
> Gen 2
> > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> > imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
>
> What can we do here? I'm wondering why Gen 2 trains correctly, while Gen =
1
> doesn't.
>
> Best regards,
> Alexander

Hi Alexander,

Does your link partner perhaps suffer from some errata?

Ironically I have had PCI link issues that required the patch you are
needing to revert on IMX8MP with specific switches.

Best Regards,

Tim
