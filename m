Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55746B0
	for <imx@lists.linux.dev>; Fri, 18 Aug 2023 22:26:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so1817107a12.0
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 15:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692397615; x=1693002415;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nFESl0MD0+L47522X6Hxj9qoRZB7iKKfXwXQV2ThguI=;
        b=ihyOUTglLkHgXv4K5/2vWaS2u7H0I8SWkOdHh68aTQsBNutF5lFjT9pA04nKAxXcrA
         WC9kOasqpMtB922gZ9POav2OBWprOUCzNQ1/3dYQXequxh1jvq0tWHbwXmdSIT6X6WTC
         OhONqhLdcA5eAsK4U9NcmpTz3671/Df1lrQTnNd3NtOSwqkA02/rKA0lfo8g2h/Hnrq0
         XwzSVJvXjJ8IOHSnI4GRHKOnYi9pwfbsEnGJqzFRPOsx/ATx8DMepr+h/Bo8PYdcim4W
         3Cl/cSBinme6sXyWMIYmkEkhTIhR3LnjX78aIPt5X/y85JXnvjW8vVPyvktEQTl2xmEZ
         jhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692397615; x=1693002415;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFESl0MD0+L47522X6Hxj9qoRZB7iKKfXwXQV2ThguI=;
        b=YzR+gtivCHjJmVKCTdbo1NUv0/KSU8oA9hJDSRQPl06y7Ahv6zMeZfKa1yg7D6ieLJ
         XcCtM9pEYYBK0bAYQrGBM5/ZCHECqrfGLeop8X5XgOO8uRlcV8p9KlWiBoJp3L0D7gDk
         Sds33MkXVmI3qdWe2uHjh9rXqlAN1DVSVWyZrt7RoP60a4YR4B9/ctTsdmVcGX2TnbPW
         pHeWoUlSKRSPFmiMvLGxXtGps2DLTWOMKFrYxEQ5GDIlOql9vBJM8YY/ooi4+JoJKe4O
         3mThaPnqxU5827q01EUF6R9YPDXZrsRCtvHZyOI/TiRgjoKY4ivqJp+xctrnrr2b4ciW
         CXEQ==
X-Gm-Message-State: AOJu0Yw9OKlcKq92XIlo6CIHCeJp8Nx6GANduFtNoprgKBMVtfNxDH2h
	S5bMJQL2P2vN71HQOAXsVfuCZiaZOM4dNsv/zvk=
X-Google-Smtp-Source: AGHT+IHihjNeBqR4QuG9RfgNbIG5E5wUCMzSCSgK14jat/hwHxhj7UaIINdLOkfJ9Cdrw/vNVsqdGa/mBLlVHpcAX2c=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:c414:0:b0:525:7f37:e87a with SMTP id
 j20-20020aa7c414000000b005257f37e87amr380010edq.16.1692397614572; Fri, 18 Aug
 2023 15:26:54 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 15:26:53 -0700
From: harrynicomama@gmail.com
In-Reply-To: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
References: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
Date: Fri, 18 Aug 2023 15:26:53 -0700
Message-ID: <CAC5d1WLXy0a_eOFAsgdyzibeJK60q2LNBj68y_3Ag9JTbFoT_A@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

testing new name headers

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
