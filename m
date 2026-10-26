Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793034625;
	b=p+DMBJuOS3BA4Pgl9ppC+kF4SlmrYfQUfh3gsG2+B4XwwVujNkX50Pz+g+TQ3XJpH+yo
	 /B1XowFEHnNJ0brgUNu8BWowCtCusEbqa+3iWtknS8hUFfyM4GHpDbs7uKxHGFoOCXb2E
	 kKBQBukXuGToCgbuoorJgvmpwAnQ0c5V0twBJRDS8eRdmbM/pPSiebgfocQAeZaeR7R5h
	 BqkuUgt8iM+gl/NKt3h6WVE5yUko1dYhXZvDOHAf8m5jYjbcHmYTE/EIbYlEfPdHVqhmV
	 7eGYtrLB1lFNhn2gvbHna+IHBDlQOXg7sTz6bsDFZaAoe7dnzdsLPMPInidp3wznM1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
	b=aL5XUczD1ajTwklq3sWSrlg5DoD9vCvyTeTskn+avtdnJBT6IQP9EnHksdAca048Xrpx
	 j1Pra0VkyX8Guf+Zq4QLaTOWAwHnxRP/ROWlcsVUgRDIDxh0jUxwEWtkQ7OI+kG/7Srsu
	 1R2bftpPg5SN/hRXxRumhMLrtJjhVTp/wfBapGl2aKm8XPD5BLcO77H00B8AkgFtAZfDL
	 av8hQe+O50dcMSg9itjM18tmWAU7YypKjRxLeSzXxR8j7TnuizEA885S2M0KRB2pLBXGF
	 aDQhDMdAWcLBOdQtLGHj03Il4FqV+khrPb+JqWFVBo8yWzpicFJT4Cat1dBvXKj0/Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I8jfwFUX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002BC606A31D
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 17:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 002BC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I8jfwFUX
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so96225e0c.0
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 10:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793034624; cv=none;
        d=google.com; s=arc-20260327;
        b=Cu4jPG19IgdzJff1zCYEqkDLOX2AHh80in2826IGIxMUYxCGFsB/Nc11GDToYf3iha
         /c+iBvtiHwQoqY402vu3o1/5/TYc8sYk1xqaKaBYz2RX2C+9TDH0CojWHVr9hRneXZKZ
         xjV7z8oD55TeBhpA6Eix+ouTYZGBXTvUxWoUD79DasVm5guQEpvyiZCU+QKm6t7qJ0gy
         Grqusm2yXK+nB5zdqOg698iFAFuls12TM8ckhTE+yzSepHQ+uyAg+oenCts19LEgj77W
         NNa3myDT+bAItWOlcl+4htWO6vm/ltCCxpqL0kWrDtIvjJ271X3a14a/SvqPzz8OpNpJ
         h5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
        fh=wpSqngL8qexR6NedMOwQ41dH9PS01aUYBESZhS88zc4=;
        b=IbnBNwgSg0COk5Wb3taSdhnHZZQQh2VmA6Z9UPc7souoVI08whQwEQYc/NiUER+7Mk
         Nf4uu+NW+ve3LSEJK4HPXQE18HU/ccCsgRGi36DbmhUni1WstXvSgHYMzoBkufgLgmxQ
         U3s605jNNMiVPXPI68IK83WhaJOBB//2o/TbUGVV9Vk28FuzuwyLzDDxgSAzoOEVDNBW
         0EVcLYmrHxaPgADjhSoGyZMaL50ocyVHQl94bQFHpahEcVcRAvrOZ1khGs0sptxV1R7t
         15PELwhfUP6q3HQmRipDctCtkmgFd5Dc6DUu1SKcZp71pp4CxqMhbsPZyER2oSidHnRd
         R1LQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793034624; x=1793639424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
        b=I8jfwFUXNxptv1sXqbtd/4mzQsMwu++zJFImS5JWZmRK0/uzVqFt7p+We6EpTEMid8
         W8egwgqDBv6oEK6Dyf6QV3vnJh1BkXkzaZM9KKAyahl8Nvsvjg72uRDvPTSfiQH3LHDa
         mYcak1Mq6o+69CgwQ1PuA6I9Wgb0a2A2Iq6uKCicJo0CHvmaMFtdLr9w1DpZboC+I7o4
         zeLGVi1UMYcPnUFwvuMNgJ1ezX5aGwR5g7rDNwenpNle7/5eLdg3b+Z+z47Po9HfNT19
         35MHApLnRgnSCQizxzBUXzFZmnfw8GvPiEGnk6ZVPH7qjM0dgQpvUZupTkMO79dSm4EQ
         jM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793034624; x=1793639424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAwtPwvP/GgJfxjpJQkSRJHv6LmBYN/Q1Oti0MV20cE=;
        b=JD2ZDirRl/UM0QmtKdo7gS5wrAMt/gJ0DtE3PO1E59NE3/WfWcxUfUnrNGk8EZrCwT
         tUB2EuRvIFLcJ0P8oP92oRWzrgx7FnxrMF2LW0nPGZFVh2YjzuzSFc6XnyXbYdCw2bnp
         ERyFFdszWT3XIaMT1fqEzuxsp/EqLy0l+zBfpdlge/BxnuAIKbrDnbN447/8/bRAB+bo
         aClWRqew8jeDXBX7RsA/KWTksEEw1dRptzYKkiBP7WyARi902CmjFRRjTvZIOYaE3MIs
         ZWf0VFLYQ0+uoD6QE5Rdm1ALLoRcnktIBWtYnHmx4N94VNgqVIqQQDfJlwCt8AZIrLnt
         NTRA==
X-Forwarded-Encrypted: i=1; AKwUvBw3vYepmCax+VgWghyztyZz90f/ZSZg/SisTEiKiVf8fwgwjOpjsTuDrFF0YsjQDdwrlAk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJil4HJVyXmOXdhR1PerIz5Ae1ZmszjtTmukMLrpzxrT/EyskN/
	/7NsbWZ3XXDwd8WHZPAaX0uHlBMOqDHbWNUwrJCJ0kA/J9+uB6wja22hF9Esk7L7xVyQv5zuF6o
	ouPfBpSSyc7QNcblOymV1Qe9T68xsu/g=
X-Gm-Gg: AYBFou3S0CxTbZ+AAGrtiKyWITUbx3rl8PvS0+LuV01xesMyQOgq5PdFX95LxvNl9ni
	PWHFP0geGQm0lFAIiMqtCzKhNwFAz/l8l2x/DKHNyVOP3EtyByrrnAt9GzNh6cqw6wogKvJJxAK
	qJtl4PxG3WnqQIp9Ho9TSDyua+PolRvmRWj7leVkfzJgh66GGZtXGi2cAjf9mwa7R/doUNK/huN
	kxrHJfXS6+44gvZtkdC7jrG8fmiOifPGjMw4Vfc6sXMODRP0RQ/q2EGWn2icpw/rOVPNgmL9YON
	Bq8NMceAQIZ/iG6GbdmzqBz/toBkiQDm8k2Ee9eSVdXnXCOdaC1rY/f24JPhqEHOs+hZpvzQk73
	tpWHWsqPYB3qeUpTrrLUSTt9J9rOcgMcJN1Rpk/RrKmFcnXEsEPmJb+7nrzjE8/0wNR68CQyNxV
	aDKcvy2lM3t7Eyw3CBXUFlLtBHAIm3L9Z/whQ+wkNXT756790/hc/bxPwE4F/fojaa6ZMnvwJNg
	zOWHr1INK3B3+Q9/X/b57bhtRAOtGc=
X-Received: by 2002:a05:6122:50e:b0:5e9:441a:d5f8 with SMTP id
 71dfb90a1353d-5ec3e8e04admr159689e0c.1.1793034623801; Mon, 26 Oct 2026
 10:10:23 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
 <a011174b-d64c-305b-7dab-62017fc885fa@linux.intel.com> <CAHQZ30AfcwMTXPpCgiWkhz1OFoxHJOqcVmur8Buz72M45Acuag@mail.gmail.com>
In-Reply-To: <CAHQZ30AfcwMTXPpCgiWkhz1OFoxHJOqcVmur8Buz72M45Acuag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 11:10:12 -0600
X-Gm-Features: AclHuK8g6EMHpoadOv3TJAD667Nte-zf1vnBPpYx8rpkF-Kg_pkoFpFDJdWRf6E
Message-ID: <CADvTj4okFSpw7Wo0e3DR4r4-1TDvOY1esoUDWftY27B7XwWAHA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] serial: 8250: serialize DMA cancellation with
 buffer reuse
To: Raul Rangel <rrangel@chromium.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 10:24=E2=80=AFAM Raul Rangel <rrangel@chromium.org>=
 wrote:
>
> On Mon, Oct 26, 2026 at 5:16=E2=80=AFAM Ilpo J=C3=A4rvinen <ilpo.jarvinen=
@linux.intel.com> wrote:
>>
>> On Sat, 24 Oct 2026, James Hilliard wrote:
>>
>> > Reserve canceled transmit and receive storage until DMA and its comple=
tion
>> > callbacks have retired. Serial-core write backpressure protects a flus=
hed
>> > TX FIFO while normal transfers continue to DMA directly from that FIFO=
.
>> >
>> > The series separates OMAP's locked completion processing and serialize=
s
>> > asynchronous write wakeups with the port lock before adding the serial=
-core
>> > reservation helpers and applying them to 8250 TX. Flushing
>> > empties the logical queue immediately. While the old transfer owns its
>> > storage, write_room() reports zero and write-ready notifications wait =
for
>> > retirement. Failed termination retains the reservation until normal
>> > completion, without advancing the reset FIFO. DMA retirement releases =
the
>> > reservation independently of port readiness. Serial core keeps writes =
and
>> > wakeups gated during shutdown until successful startup or resume.
>> >
>> > RX delivers paused data before the PIO fallback and retires callbacks =
in
>> > process context. Track FIFO access separately from buffer retirement s=
o
>> > PIO and the DesignWare empty-FIFO timeout handling can run once DMA ha=
s
>> > released the FIFO. On failure, retain the requested interrupt enables =
in
>> > the existing IER shadow and mask receive interrupts in hardware until =
DMA
>> > has stopped. Recovery then leaves RX on PIO until reopen. Shutdown exc=
ludes
>> > new retirement work before releasing the channels.
>> >
>> > Based on tty-next with the posted shutdown guard [0], channel
>> > configuration error handling [1], RX TTY accounting fix [2], RZ/N1
>> > transfer-length fix [3], transmit-PM shutdown fix [4], serport
>> > write-wakeup deferral [5], DesignWare BUSY-safe fractional-divisor
>> > programming [6], and Intel MID RX DMA timeout locking [7]. The serport=
 fix
>> > is needed before serializing the remaining write-wakeup callers with t=
he
>> > port lock.
>> >
>> > [0] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-shutdown=
-v1-v1-1-3d3ce383c614@gmail.com
>> > [1] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-config-e=
rrors-v1-v1-1-c067587d1ef2@gmail.com
>> > [2] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-rx-accou=
nting-v1-v1-1-c11795914ab4@gmail.com
>> > [3] https://lore.kernel.org/r/20261023-submit-serial-8250-dma-tx-lengt=
h-v1-v2-1-c3106ef4d2df@gmail.com
>> > [4] https://lore.kernel.org/r/20261022-submit-serial-8250-tx-pm-shutdo=
wn-v1-v1-1-0e894afa3bb8@gmail.com
>> > [5] https://lore.kernel.org/r/20261023-submit-serport-write-wakeup-v1-=
v1-1-74e7311638a2@gmail.com
>> > [6] https://lore.kernel.org/r/20261024-submit-serial-8250-dw-divisor-v=
1-v2-1-032ca5338359@gmail.com
>> > [7] https://lore.kernel.org/r/20261024-submit-serial-8250-mid-rx-lock-=
v1-v1-1-2b9afdf869d7@gmail.com
>> >
>> > Assisted-by: Codex:gpt-6-astra
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> > ---
>> > Changes in v6:
>>
>> Hi,
>
>
>>
>>
>>
>> This series is moving way too fast with new versions. Please slow down.
>
>
> +1. I think you should have spent more time refining your patch set befor=
e submission, or sending individual patches that weren't interelated.

I was doing as much validation as I could locally already but often I
was missing
issues the Sashiko review bot was flagging. Since the Sashkio reviews appea=
red
to be release issues I was doing respins to try and fix all those issues.

Apparently not everyone is seeing those reviews posted despite them showing
up fine in lore for me.[0]

Is everyone here seeing those reviews or are they not showing up?

[0] https://lore.kernel.org/all/CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCH=
NPo3pS6w@mail.gmail.com/

>
>>
>>
>> We're not aiming to who manages to produce highest version counter for a
>> series. ;-)
>>
>> You're making non-trivial changes so please do expect human review to
>> take time. Cranking new versions almost back to back (or even every othe=
r
>> day) will just fill up inboxes.
>>
>> --
>>  i.
>>
>>
>> > - Use v2 of the DesignWare BUSY-safe fractional-divisor prerequisite.
>> > - Serialize CLPS711x TX servicing and interrupt-enable state with the
>> >   port lock. Use non-waiting IRQ disable in stop_tx(), skip queued TX
>> >   interrupts after stopping, and drain the handler outside the lock
>> >   during shutdown.
>> > - Make the Atmel RX/TX tasklets and SB1250 termios locking IRQ-safe
>> >   alongside their interrupt-handler locking, preserving the caller's
>> >   interrupt state when releasing the port lock.
>> > - Report RX DMA recovery after releasing the port lock, keeping the
>> >   state changes and interrupt-enable restoration serialized.
>> > - Link to v5: https://patch.msgid.link/20261024-submit-serial-8250-dma=
-cancel-v1-v5-0-9e52968928d2@gmail.com
>> >
>> > Changes in v5:
>> > - Add the posted serport write-wakeup deferral as a prerequisite for t=
he
>> >   caller-locking preparation.
>> > - Add a preparatory patch serializing asynchronous write-wakeup caller=
s
>> >   with the port lock, including indirect CTS and transmit-helper calls=
.
>> >   Keep sleeping register accesses outside the lock and defer SCCNXP
>> >   notifications until its controller lock is released.
>> > - Use the separately posted DesignWare BUSY-safe fractional-divisor fi=
x
>> >   and Intel MID RX DMA timeout locking fix as prerequisites, leaving f=
ive
>> >   patches in this series.
>> > - Separate serial-core write readiness from DMA storage reservations. =
Record
>> >   retirement during startup and shutdown while keeping writes and wake=
ups
>> >   gated until the port is ready.
>> > - Wake deferred writers after successful startup or resume, including =
when
>> >   reopening with a retained FIFO, and restart any retained queued outp=
ut.
>> > - Keep the write-ready notification pending while retained output is a=
t or
>> >   above the normal wakeup threshold, until TX completion drains it.
>> > - Publish resume readiness under the TX restart lock without releasing=
 a
>> >   reservation that may belong to a newly flushed transfer.
>> > - Release 8250's TX reservation after shutdown has stopped DMA and unm=
apped
>> >   the source; serial core retains control of write readiness.
>> > - Link to v4: https://patch.msgid.link/20261023-submit-serial-8250-dma=
-cancel-v1-v4-0-e759de1839de@gmail.com
>> >
>> > Changes in v4:
>> > - Retain flushed TX reservations through shutdown and failed resume. R=
elease
>> >   them after successful resume, or when allocating a new FIFO on reope=
n,
>> >   so retirement cannot wake writers into a closing port.
>> > - Treat RX flush as complete once the channel is inactive, and clear t=
he
>> >   shutdown guard before startup configures the UART and tests interrup=
ts.
>> > - Check completion after a failed pause so a transfer that finished be=
fore
>> >   its callback acquired the port lock is delivered and retired normall=
y.
>> > - Keep DesignWare's BUSY-safe divisor setter after fractional-divisor
>> >   discovery, writing DLF and DLL/DLH only after confirming DLAB.
>> > - Link to v3: https://patch.msgid.link/20261023-submit-serial-8250-dma=
-cancel-v1-v3-0-d78f9e4c4932@gmail.com
>> >
>> > Changes in v3:
>> > - Defer write-ready wakeups while flushed TX storage is reserved, and
>> >   serialize the flush wakeup with the reservation under the port lock.
>> > - Suppress ordinary TX starts during the reservation while preserving
>> >   high-priority flow-control characters, which use separate storage.
>> > - Separate RX FIFO access from callback retirement, allowing PIO and t=
he
>> >   DesignWare empty-FIFO timeout workaround after a successful pause an=
d
>> >   termination while keeping the receive buffer reserved.
>> > - Use the existing IER shadow for requested enables and a shared regis=
ter
>> >   writer to keep receive interrupts masked throughout DMA error recove=
ry,
>> >   including termios, RS485, modem-status and overrun-backoff updates.
>> > - Preserve the timeout-enable bit across stop_rx(), exclude late shutd=
own
>> >   interrupts from PIO, and avoid FIFO resets during RX DMA recovery.
>> > - Preserve the completion-path LSR read after stop_rx(), while gating =
DMA
>> >   resubmission on the receive interrupt enable.
>> > - Pack the cancellation flags after moving all their accesses under th=
e
>> >   port lock, including the recovery worker's snapshot and initializati=
on.
>> > - Apply the early-return, shared-helper and line-wrapping cleanups.
>> > - Link to v2: https://patch.msgid.link/20261022-submit-serial-8250-dma=
-cancel-v1-v2-0-088ea51e3891@gmail.com
>> >
>> > Changes in v2:
>> > - Add serial-core helpers to reserve flushed transmit storage until DM=
A
>> >   retirement. Apply write backpressure during that interval and keep n=
ormal
>> >   TX using the FIFO directly, replacing the private transmit buffer in=
 v1.
>> > - Document the flush callback's reservation, writer backpressure and
>> >   retirement requirements, including release before shutdown returns.
>> > - Split the OMAP completion refactor into a preparatory patch and move
>> >   the RZ/N1 preparation-order and shutdown PM fixes to independent
>> >   submissions, keeping four patches in this series.
>> > - Take runtime PM references around worker UART accesses, and leave no=
rmal
>> >   RX retirement to release ownership without reading LSR or restarting=
 DMA.
>> > - Synchronize the queued TX ranges before preparing the descriptor and
>> >   return the mapping to CPU ownership before releasing the reservation=
.
>> > - Keep the TX transfer length separate from FIFO cancellation, so a fa=
iled
>> >   termination can account completion without advancing the reset FIFO.
>> > - Exclude late RX flush work during shutdown, including Intel MID DMA
>> >   timeout interrupts which are independent of UART_IER.
>> > - Accept DMA_IN_PROGRESS after successful pause, and recover from fail=
ed
>> >   pause, termination or DMA_ERROR before handing the receiver to PIO.
>> > - Preserve stop_rx() and shutdown across recovery, and retain the
>> >   DesignWare empty-FIFO timeout workaround when receiving through PIO.
>> > - Apply the requested guard spacing and container_of() formatting.
>> > - Link to v1: https://patch.msgid.link/20261021-submit-serial-8250-dma=
-cancel-v1-v1-0-efe2b89f2303@gmail.com
>> >
>> > ---
>> > James Hilliard (5):
>> >       serial: 8250_omap: separate locked TX DMA completion processing
>> >       serial: serialize asynchronous write wakeups with the port lock
>> >       serial: core: allow drivers to reserve flushed transmit storage
>> >       serial: 8250: drain canceled TX DMA before reusing its buffer
>> >       serial: 8250: retire canceled RX DMA before reusing the receive =
buffer
>> >
>> >  drivers/tty/serial/21285.c          |   2 +
>> >  drivers/tty/serial/8250/8250.h      |  59 +++++++-
>> >  drivers/tty/serial/8250/8250_core.c |   2 +-
>> >  drivers/tty/serial/8250/8250_dma.c  | 286 +++++++++++++++++++++++++++=
---------
>> >  drivers/tty/serial/8250/8250_dw.c   |  27 +++-
>> >  drivers/tty/serial/8250/8250_omap.c |  38 +++--
>> >  drivers/tty/serial/8250/8250_port.c |  31 ++--
>> >  drivers/tty/serial/atmel_serial.c   |  12 +-
>> >  drivers/tty/serial/clps711x.c       |  23 ++-
>> >  drivers/tty/serial/cpm_uart.c       |   2 +
>> >  drivers/tty/serial/fsl_lpuart.c     |   2 +-
>> >  drivers/tty/serial/jsm/jsm_cls.c    |   3 +-
>> >  drivers/tty/serial/jsm/jsm_neo.c    |   9 +-
>> >  drivers/tty/serial/lantiq.c         |   3 +-
>> >  drivers/tty/serial/ma35d1_serial.c  |   6 +-
>> >  drivers/tty/serial/max3100.c        |   6 +-
>> >  drivers/tty/serial/max310x.c        |   9 +-
>> >  drivers/tty/serial/mux.c            |  13 +-
>> >  drivers/tty/serial/mvebu-uart.c     |   2 +
>> >  drivers/tty/serial/mxs-auart.c      |   2 +
>> >  drivers/tty/serial/sb1250-duart.c   |  14 +-
>> >  drivers/tty/serial/sccnxp.c         |  45 ++++--
>> >  drivers/tty/serial/serial_core.c    | 100 +++++++++++--
>> >  drivers/tty/serial/ucc_uart.c       |   6 +-
>> >  include/linux/serial_core.h         |  18 ++-
>> >  25 files changed, 551 insertions(+), 169 deletions(-)
>> > ---
>> > base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
>> > change-id: 20261021-submit-serial-8250-dma-cancel-v1-b208f84e89c1
>> > prerequisite-patch-id: 3604bfaa3a1c214997de1f11162b81a4541af5ab
>> > prerequisite-patch-id: 79dd093ffb35e254e790dffb8887faf51b64f947
>> > prerequisite-patch-id: 80a5061d84c055a64c760268febed179c687b99f
>> > prerequisite-patch-id: 7dbb404baf1f861982cf6a4b755d39cfec548223
>> > prerequisite-patch-id: 40881d81a27b3a1aa45203d171214faaf2197768
>> > prerequisite-patch-id: 4456eb7f800cb5d50a70c898e6d5a452a7f0bca4
>> > prerequisite-patch-id: c3d8ac0d54d1bfe43657964c517cfa4c7fde11af
>> > prerequisite-patch-id: 48659e5ef3f5fb377d0b751f0830c0de4699262c
>> >
>> > Best regards,
>> > --
>> > James Hilliard <james.hilliard1@gmail.com>
>> >
>>
>> --
>>  i.
>>
