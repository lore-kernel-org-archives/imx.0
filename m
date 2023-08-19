Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B663C
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 02:53:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-317c3ac7339so1366328f8f.0
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 19:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692413601; x=1693018401;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xzcl4X3D+jGHWBZBOqLwUXi6i3+B1nQpA1y4Ebg1/Rk=;
        b=lMWjvnZYma0tMc79AsQOWODnJUD4NOtiA7k3gKyIE46OEKHoiJms7AwWiOy/7tPMyv
         Dtat+neOF2JdTYVge9lxXzqGMjW6Nb1jJFQ7a0TmDbhfjMSgOxBPRKc/I5LVLrik7z1k
         JHqr1ra0JdDqWSCUxd4qboJVDl3BbCxo085KZ4F5WFDEZOD0sWCYdELbfDGV2KeY0ZOn
         9533ETxf/KPm7iHu2mCTeR7WqdGfHjHX9rMYbyRNnV8QhSXRPvJCGqq/5mxXf2MX6vmo
         g9R+l9oGwvkPItzkN1Fqf3is+/U6ul7ePU54JmZg1rcJMDLp/39/Un9JvYnU7JrLhvvd
         AgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692413601; x=1693018401;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzcl4X3D+jGHWBZBOqLwUXi6i3+B1nQpA1y4Ebg1/Rk=;
        b=UHiScPP3y1YJK8YjV0KxO3FxFpEprC1GkQEqpc59sW2/LP32FbMjSnFHYfB0ugdZTb
         qzv9nq9SVefs4rMxrihzKCABllZjhIkdRE7HGuzNlo1t79088xuI7d4yz5YOhGsHkHMS
         8wc4OXCK97DsM+27JmXQrOMxOc5HkttJfPDRG5WwLfiJYh93RMn0siiwgWJw6FDFzHkw
         QzEYzHScUIG6v/VoGL57YwkYnI3dJ3jCbCxwjEtjH8xmDRVKW3Dv1ni1pC1AW3wUna2U
         o0M1SwpTfShtid4xI0uzIIA7SYJ1iLlC0ZznGcBHOSAidCv6SSWfK2Zv+ZhWFcs7YyXl
         DMVA==
X-Gm-Message-State: AOJu0YycQTLq+mdA4646BpSnJ3MNJoxswk9x00Psl+1fwoShvbiosGdP
	urz+YJHT7JaBjSU5mSJXGL7htY052iFqVLIiygg=
X-Google-Smtp-Source: AGHT+IEFTwvPnF793nLg7l7oAvQVrYfeMeHcmwgq4ULHpd4MJWSHIq579dy+xIs6naO/l4KYIfyQ4UnhSguLdaCO5dg=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5d:678c:0:b0:317:64f4:5536 with SMTP id
 v12-20020a5d678c000000b0031764f45536mr637592wru.44.1692413601171; Fri, 18 Aug
 2023 19:53:21 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 19:53:20 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1WLczUTOP8GOg2uUdxXVGOZ_ihSFjeXBu3X7VDBTLD-gmQ@mail.gmail.com>
References: <CAC5d1WLczUTOP8GOg2uUdxXVGOZ_ihSFjeXBu3X7VDBTLD-gmQ@mail.gmail.com>
Date: Fri, 18 Aug 2023 19:53:20 -0700
Message-ID: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

> test header bug fix

testing buttons

Acked-by: Qi Wang <harrynicomama@gmail.com>


==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
