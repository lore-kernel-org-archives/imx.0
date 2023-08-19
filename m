Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BBC1383
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 03:49:41 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9fa64db41so26132191fa.1
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 20:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692416979; x=1693021779;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bByDUX+k7+9VC0lKTe8gGACMxQGaaB9qWHUUsvUIsBk=;
        b=nuM2kY2Oo07LwX7Pasrk6G4fY++/djlaVkmQY2Vu5a7euywMz39klwW3ZDaw8UTNEV
         C/BrWu7O+wmmoN2PRyoYO6QdSBivRC0KUvWsPAxwJtYgbDe+6O5pvxaLc8AQmk8Xol+U
         xYkjHYBcJFqZD4zwPW/mJYmJc/tXdASzD7EUcozSjlK4srW4aPz4i9qlg2GFV5nznnfJ
         2TeeqCpDAHr8V2u38RB43mlugkLvbN+oD1VIE9e7PZT/qM7r9ruL6wVnFtm95xJl/qOB
         YkSQg5EWJKSrHr7zGwKe4JmCoTuun8thGlFuuecxgs7Aq0UyVkWKz7KvjN8zKcnhm5Vx
         9dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692416979; x=1693021779;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bByDUX+k7+9VC0lKTe8gGACMxQGaaB9qWHUUsvUIsBk=;
        b=fkS9jV2oCyPi01K4ecNXoruKIHrBMDG6u3rpxjpi6kzNdRNn7QSFwOf2ayGDZDV0me
         HW86+bhLSXQmdGW8ZG9F+MJDdiSRtgKyTqlKYmLNsPNiDsVeO/CxZXw8qIoe61nKTqlP
         azjOKlhQ0XAGSfa675B3uoFDc0Kpxuo3bM+ZLWiZfpS9Zhxh8eV7thM12GHSjUI4dIHw
         4/5HDwdj2gkwHKmeWR4R4BLLJ34LIt7m2SxPuH7aETq/W4YzWJN1jBuBzByZiVfMKi4B
         lJ9NinBwFlY6Sk8p2KRGqTAyqW4ciyqHLeFgvRgsDMLctsFcbT6l8ROSojMMbm7BL8CB
         TraQ==
X-Gm-Message-State: AOJu0YyUE4FU/1KboW6VcbUOCMutX/biHSEJF6Zo7ElXXTk5WjPjJMJC
	t1SCMIg6u1/p1DsukK6SMuQPrYzG0t5xx0nbvyA=
X-Google-Smtp-Source: AGHT+IG+OxTozMB6VFzdGOEwy7DncTdWGurDvwO9BTk+xg10dG95x091+bW3Qv6iXH6anfGX2bDN2rYwg+gUAB4cctY=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6512:33c6:b0:4f8:631b:bf77 with SMTP id
 d6-20020a05651233c600b004f8631bbf77mr816355lfg.22.1692416978691; Fri, 18 Aug
 2023 20:49:38 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 20:49:38 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
References: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
Date: Fri, 18 Aug 2023 20:49:38 -0700
Message-ID: <CAC5d1WKSczxf5jRwkBWQj8+y4rcEE1bH7M=-z--nikxNBwOi-A@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

test 3

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
